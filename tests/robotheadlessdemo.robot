*** Settings ***
Documentation  Basic docs for suite
Library  SeleniumLibrary
Library  XvfbRobot

*** Variables ***

*** Test cases ***
Open WebApp on Firefox
    [Documentation]  Access the webapp index page
    [Tags]  smoke
    Start Virtual Display  1920  1080
    Open Browser  http://127.0.0.1:8780/webapp/index.jsp  firefox
    Sleep  5s
    Capture Page Screenshot
    Click Link  persons
    Wait Until Page Contains  Amy  10 s
    Sleep  2s
    Capture Page Screenshot
    Close All Browsers

*** Keywords ***
