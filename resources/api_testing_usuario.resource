*** Settings ***
Library    String
Library     RequestsLibrary
Library    Collections

*** Keywords ***
Create a new user
    Set Test Variable    ${NAME}    JOÃO DA SILVA
    ${random_string}  Generate Random String  length=8    chars=[LETTERS][LOWER]
    Set Test Variable   ${EMAIL}  ${random_string}@email.com
    Set Test Variable    ${PASSWORD}    1234
    Set Test Variable    ${ADMINISTRATOR}   true
    &{user}     Create Dictionary   nome=${NAME}    email=${EMAIL}  password=${PASSWORD}
    ...     administrador=${ADMINISTRATOR}
    Set Test Variable    &{USER}    &{user}

Create ServeRest session
    &{headers}  Create Dictionary   accept=application/json     Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev/  disable_warnings=1  headers=&{headers}

Register user
    [Arguments]     ${expected_status}  &{user}
    Create ServeRest session
    ${response}     Post On Session  alias=ServeRest  url=/usuarios  json=&{user}   expected_status=${expected_status}
    RETURN  ${response}

Register the new user on ServeRest
    ${response}     Register user   201     &{USER}
    Set Test Variable    ${REGISTER_USER_RESPONSE}   ${response}

Check if the user was successfully registered
    Dictionary Should Contain Item  ${REGISTER_USER_RESPONSE.json()}   message     Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${REGISTER_USER_RESPONSE.json()}    _id

Repeat the user registration
    ${response}     Register user   400     &{USER}
    Set Test Variable    ${REGISTER_REPEATED_USER_RESPONSE}     ${response}

Verify if the API did not allow the repeated registration
    Dictionary Should Contain Item    ${REGISTER_REPEATED_USER_RESPONSE.json()}    message
    ...     Este email já está sendo usado

Search for the user on ServeRest
    ${response}     GET On Session  alias=ServeRest     url=/usuarios/${REGISTER_USER_RESPONSE.json()}[_id]
    ...     expected_status=200
    Set Test Variable   ${SEARCH_USER_BY_ID_RESPONSE}   ${response}

Check if the user was successfully searched
    Should Be Equal As Integers     ${SEARCH_USER_BY_ID_RESPONSE.status_code}    200