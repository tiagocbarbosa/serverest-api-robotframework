*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Access the ServeRest portal
  Go To  https://front.serverest.dev/login
  Wait Until Element Is Visible  h1