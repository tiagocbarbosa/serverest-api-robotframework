*** Settings ***
Resource  users-keywords.robot
Resource  commons.robot

*** Keywords ***
Login user
  [Arguments]  ${body}
  Create session if not exists  ServeRest
  ${response} =  POST On Session  alias=ServeRest  url=/login  json=${body}  expected_status=anything                                             
  RETURN  ${response}

Check response of login user
  [Arguments]  ${response}
  Should Be Equal As Strings  ${response.status_code}  200
  Should Be Equal As Strings  ${response.reason}  OK
  Dictionary Should Contain Item  ${response.json()}  message  Login realizado com sucesso
  Dictionary Should Contain Key  ${response.json()}  authorization

Check response of invalid login user
  [Arguments]  ${response}
  Should Be Equal As Strings  ${response.status_code}  401
  Should Be Equal As Strings  ${response.reason}  Unauthorized
  Dictionary Should Contain Item  ${response.json()}  message  Email e/ou senha inválidos

# -----------------
# TO BE REFACTORED
# -----------------

# Login with the user
#     Create ServeRest session
#     &{user}     Create Dictionary   email=fulano@qa.com  password=teste
#     ${response}     Post On Session  alias=ServeRest  url=/login  json=&{user}   expected_status=200
#     Set Test Variable    ${LOGIN_RESPONSE}  ${response}

# Check if login was succesful
#     Dictionary Should Contain Item    ${LOGIN_RESPONSE.json()}    message    Login realizado com sucesso
#     Dictionary Should Contain Key    ${LOGIN_RESPONSE.json()}    authorization