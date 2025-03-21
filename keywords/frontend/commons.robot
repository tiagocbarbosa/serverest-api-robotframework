*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Open the brownser
  Open Browser  browser=chrome
  Maximize Browser Window

Close the browser
  Close Browser