*** Settings ***
Resource    ../resources/api_testing_login.resource

*** Test Cases ***
Scenario 01: Login with a new user successfully
    Create a new user
    Register the new user on ServeRest
    Login with the user
    Check if login was succesful