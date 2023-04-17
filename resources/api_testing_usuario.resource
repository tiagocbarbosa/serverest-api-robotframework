*** Settings ***
Library    String

*** Keywords ***
Create a new user
    Set Test Variable    ${NAME}    JOÃO DA SILVA
    ${random_string}  Generate Random String  8    [LOWER]
    Set Test Variable   ${EMAIL}  ${random_string}@email.com
    Set Test Variable    ${PASSWORD}    1234
    Set Test Variable    ${ADMINISTRATOR}   ${FALSE}
    &{user}     Create Dictionary   name=${NAME}    email=${EMAIL}  password=${PASSWORD}    administrator=${ADMINISTRATOR}
    Set Test Variable    &{USER}    &{user}

Register the new user on ServeRest
