*** Settings ***
Library     RequestsLibrary

*** Keywords ***
Create ServeRest session
    &{headers}  Create Dictionary   accept=application/json     Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev/  disable_warnings=1  headers=&{headers}