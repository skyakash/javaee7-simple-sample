*** Settings ***
Documentation  Basic test using HttpLibrary.HTTP for suite
Library  HttpLibrary.HTTP

*** Variables ***

*** Test cases ***
Access webapp persons service using httplibrary
    [Documentation]  Access the webapp service 
    [Tags]  smoke
    Create Http Context  http://127.0.0.1:8780
    GET  http://127.0.0.1:8780/webapp/resources/persons
    Sleep  2s 
    ${body}=  Get Response Body
    Should Start With  ${body}  <?xml version="1.0" encoding="UTF-8"
    Should Contain  ${body}  Sheldon
    Sleep  2s    
    ${status}=  Get Response Status
    Should Start With  ${status}  200
    Should Contain  ${status}  OK
    Sleep  2s
    Response Body Should Contain  Amy

*** Keywords ***
