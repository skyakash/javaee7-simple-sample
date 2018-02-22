*** Settings ***
Documentation  Basic docs for suite
Library  SeleniumLibrary
Library  Screenshot

*** Variables ***

*** Test cases ***
Open Google on Firefox
    [Documentation]  Access the webapp index page
    [Tags]  smoke
    Open Browser  http://127.0.0.1:8780/webapp/index.jsp  firefox
    Sleep  5s
    Click Link  persons
    Wait Until Page Contains  Amy  10 s
    Sleep  2s
    Capture Page Screenshot
    Close All Browsers

*** Keywords ***
