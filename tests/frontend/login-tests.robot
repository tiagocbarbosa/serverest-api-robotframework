*** Settings ***
Resource  ../../keywords/frontend/commons.robot
Resource  ../../keywords/frontend/login-keywords.robot
Suite Setup  Open the brownser
Suite Teardown  Close the browser

*** Test Cases ***
Register a new user
  Access the ServeRest portal