*** Settings ***
Library  String
Resource  ../../keywords/backend/login-keywords.robot
Resource  ../../keywords/backend/users-keywords.robot

*** Test Cases ***
Login with user
  [Tags]  LOGIN  POSITIVE
  ${randomText} =  Generate Random String  length=5  chars=[LOWER]
  ${user} =  Create Dictionary  nome=John
  ...  email=john${randomText}@gmail.com
  ...  password=123456
  ...  administrador=false
  Register user  ${user}

  ${loginUser} =  Create Dictionary  email=${user}[email]  password=${user}[password]
  ${loginResponse} =  Login user  ${loginUser}
  Check response of login user  ${loginResponse}

Login with invalid credential
  [Tags]  LOGIN  NEGATIVE
  ${randomText} =  Generate Random String  length=5  chars=[LOWER]
  ${user} =  Create Dictionary  email=notRegistered_${randomText}@gmail.com
  ...  password=123456
  ${loginResponse} =  Login user  ${user}
  Check response of invalid login user  ${loginResponse}

# -----------------
# TO BE REFACTORED
# -----------------

# Create a new user
# Register the new user on ServeRest
# Login with the user
# Check if login was succesful