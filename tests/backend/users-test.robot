*** Settings ***
Library  String
Resource  ../../keywords/backend/users-keywords.robot

*** Test Cases ***
Register a new user
  [Tags]  CREATE
  ${randomText} =  Generate Random String  length=5  chars=[LOWER]
  ${user} =  Create Dictionary  nome=John
  ...  email=john${randomText}@gmail.com
  ...  password=123456
  ...  administrador=false
  ${response} =  Register user  ${user}
  Check response of register user  ${response}

Search an user by id
  [Tags]  SEARCH
  ${randomText} =  Generate Random String  length=5  chars=[LOWER]
  ${user} =  Create Dictionary  nome=John
  ...  email=john${randomText}@gmail.com
  ...  password=123456
  ...  administrador=false
  ${response} =  Register user  ${user}

  ${userId} =  Set Variable  ${response.json()}[_id]
  ${response} =  Search user by id  ${userId}
  Check response of search user by id  ${response}
  ...  ${userId}
  ...  ${user}[nome]
  ...  ${user}[email]
  ...  ${user}[password]
  ...  ${user}[administrador]

# -----------------
# TO BE REFACTORED
# -----------------

#     Create a new user
#     Register the new user on ServeRest
#     Check if the user was successfully registered

# Scenario 02: Register an existing email on ServeRest
#     Create a new user
#     Register the new user on ServeRest
#     Check if the user was successfully registered
#     Repeat the user registration
#     Verify if the API did not allow the repeated registration

# Scenario 03: Register and search successfully a new user on ServeRest
#     Create a new user
#     Register the new user on ServeRest
#     Check if the user was successfully registered
#     Search for the user on ServeRest
#     Check if the user was successfully searched