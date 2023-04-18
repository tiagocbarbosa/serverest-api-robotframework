*** Settings ***
Library    String
Library     RequestsLibrary

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