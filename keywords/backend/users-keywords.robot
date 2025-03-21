*** Settings ***
Library  RequestsLibrary
Library  Collections
Resource  commons.robot

*** Keywords ***
Register user
  [Arguments]  ${body}
  Create session if not exists  ServeRest
  ${response} =  POST On Session  alias=ServeRest  url=/usuarios  json=${body}                                                    
  RETURN  ${response}

Check response of register user
  [Arguments]  ${response}
  Should Be Equal As Strings  ${response.status_code}  201
  Should Be Equal As Strings  ${response.reason}  Created
  Dictionary Should Contain Item  ${response.json()}  message  Cadastro realizado com sucesso
  Dictionary Should Contain Key  ${response.json()}  _id

Search user by id
  [Arguments]  ${id}
  Create session if not exists  ServeRest
  ${response} =  GET On Session  alias=ServeRest  url=/usuarios/${id}
  RETURN  ${response}

Check response of search user by id
  [Arguments]  ${response}
  ...  ${id}
  ...  ${name}
  ...  ${email}
  ...  ${password}
  ...  ${admin}
  Should Be Equal As Strings  ${response.status_code}  200
  Should Be Equal As Strings  ${response.reason}  OK
  Should Be Equal  ${response.json()}[nome]  ${name}
  Should Be Equal  ${response.json()}[email]  ${email}
  Should Be Equal  ${response.json()}[password]  ${password}
  Should Be Equal  ${response.json()}[administrador]  ${admin}
  Should Be Equal  ${response.json()}[_id]  ${id}

# -----------------
# TO BE REFACTORED
# -----------------

# Register the new user on ServeRest
#     ${response}     Register user   201     &{USER}
#     Set Test Variable    ${REGISTER_USER_RESPONSE}   ${response}

# Check if the user was successfully registered
#     Dictionary Should Contain Item  ${REGISTER_USER_RESPONSE.json()}   message     Cadastro realizado com sucesso
#     Dictionary Should Contain Key    ${REGISTER_USER_RESPONSE.json()}    _id

# Repeat the user registration
#     ${response}     Register user   400     &{USER}
#     Set Test Variable    ${REGISTER_REPEATED_USER_RESPONSE}     ${response}

# Verify if the API did not allow the repeated registration
#     Dictionary Should Contain Item    ${REGISTER_REPEATED_USER_RESPONSE.json()}    message
#     ...     Este email já está sendo usado

# Search for the user on ServeRest
#     ${response}     GET On Session  alias=ServeRest     url=/usuarios/${REGISTER_USER_RESPONSE.json()}[_id]
#     ...     expected_status=200
#     Set Test Variable   ${SEARCH_USER_BY_ID_RESPONSE}   ${response}

# Check if the user was successfully searched
#     Should Be Equal As Integers     ${SEARCH_USER_BY_ID_RESPONSE.status_code}    200
#     Dictionary Should Contain Item  ${SEARCH_USER_BY_ID_RESPONSE.json()}    nome    JOÃO DA SILVA
#     Dictionary Should Contain Item  ${SEARCH_USER_BY_ID_RESPONSE.json()}    email    ${EMAIL}
#     Dictionary Should Contain Item  ${SEARCH_USER_BY_ID_RESPONSE.json()}    password    1234
#     Dictionary Should Contain Item  ${SEARCH_USER_BY_ID_RESPONSE.json()}    administrador    true
#     Dictionary Should Contain Item  ${SEARCH_USER_BY_ID_RESPONSE.json()}    _id    ${REGISTER_USER_RESPONSE.json()}[_id]