*** Settings ***
Resource    ../resources/api_testing_usuario.resource

*** Test Cases ***
Scenario 01: Register a new user successfully on ServeRest
    Create a new user
    Register the new user on ServeRest
    Check if the user was successfully registered

Scenario 02: Register and search successfully a new user on ServeRest
    Create a new user
    Register the new user on ServeRest
    Check if the user was successfully registered
    Search for the user on ServeRest
    Check if the user was successfully searched