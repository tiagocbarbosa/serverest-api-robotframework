*** Settings ***
Resource    api_testing_usuario.resource
Resource   commons.resource

*** Keywords ***
Login with the user
    Create ServeRest session
    &{user}     Create Dictionary   email=fulano@qa.com  password=teste
    ${response}     Post On Session  alias=ServeRest  url=/login  json=&{user}   expected_status=200
    Set Test Variable    ${LOGIN_RESPONSE}  ${response}

Check if login was succesful
    Dictionary Should Contain Item    ${LOGIN_RESPONSE.json()}    message    Login realizado com sucesso
    Dictionary Should Contain Key    ${LOGIN_RESPONSE.json()}    authorization