*** Settings ***
Documentation  This example demonstrates executing commands on a remote machine
...                    and getting their output and the return code.
...
...                    Notice how connections are handled as part of the suite setup and
...                    teardown. This saves some time when executing several test cases.

Library  SSHLibrary
Suite Setup  Open Connection And Log In
Suite Teardown  Close All Connections

*** Variables ***
${HOST}  127.0.0.1
${USERNAME}  root
${PASSWORD}  vagrant

*** Test Cases ***
Execute Command And Verify Output
    [Documentation]  Execute Command can be used to ran commands on the remote machine.
    ...                The keyword returns the standard output by default.
    Execute Command  curl http://127.0.0.1:8780/webapp/resources/persons -o /tmp/output.xml
    ${output}=  Execute Command  xmllint /tmp/output.xml --pretty 1
    Should Contain  ${output}  Amy


*** Keywords ***
Open Connection And Log In
    Open Connection  ${HOST}
    Login  ${USERNAME}  ${PASSWORD}

