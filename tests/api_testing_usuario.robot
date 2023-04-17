*** Settings ***
Resource    ../resources/api_testing_usuario.resource

*** Test Cases ***
Cenário 01: - Cadastrar um novo usuário com sucesso na ServeRest
    Create a new user
    Register the new user on ServeRest
    Check if the user was successfully registered