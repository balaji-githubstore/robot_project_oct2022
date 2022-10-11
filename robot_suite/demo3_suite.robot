*** Settings ***
Library    OperatingSystem

*** Test Cases ***
TC4
    Log To Console    D:\\Mine\\Balaji-Profile.pdf
    Log To Console    D:${/}Mine${/}Balaji-Profile.pdf
    Log To Console    ${/}
    
TC1
    @{files}    List Files In Directory    D:${/}Mine 
    Log To Console    ${files}

TC2
    Create File    D:${/}hello.txt    Robot Framework Oct Session
    File Should Exist    D:${/}hello.txt
    Remove File    path=D:${/}hello.txt

TC3
    Log To Console    ${CURDIR}
    Log To Console    ${EXECDIR}
    Log To Console    ${TEST_NAME}
    Log To Console    ${SUITE_NAME}
    