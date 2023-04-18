*** Settings ***
Library    String
Library     RequestsLibrary

*** Keywords ***
Create a new user
    Set Test Variable    ${NAME}    JOÃO DA SILVA
    ${random_string}  Generate Random String  length=8    chars=[LETTERS][LOWER]
    Set Test Variable   ${EMAIL}  ${random_string}@email.com
    Set Test Variable    ${PASSWORD}    1234
    Set Test Variable    ${ADMINISTRATOR}   false
    &{user}     Create Dictionary   nome=${NAME}    email=${EMAIL}  password=${PASSWORD}
    ...     administrador=${ADMINISTRATOR}
    Set Test Variable    &{USER}    &{user}

Create ServeRest session
    &{headers}  Create Dictionary   accept=application/json     Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev/  disable_warnings=1  headers=&{headers}

Register the new user on ServeRest
    Create ServeRest session
    ${response}     Post On Session  alias=ServeRest  url=/usuarios  json=&{USER}   expected_status=201
    Set Test Variable    ${REGISTER_USER_RESPONSE}   ${response}

Check if the user was successfully registered
    Should Be Equal As Integers     ${REGISTER_USER_RESPONSE.status_code}    201

Search for the user on ServeRest
    ${response}     GET On Session  alias=ServeRest     url=/usuarios/${REGISTER_USER_RESPONSE.json()}[_id]
    ...     expected_status=200
    Set Test Variable   ${SEARCH_USER_BY_ID_RESPONSE}   ${response}

Check if the user was successfully searched
    Should Be Equal As Integers     ${SEARCH_USER_BY_ID_RESPONSE.status_code}    200