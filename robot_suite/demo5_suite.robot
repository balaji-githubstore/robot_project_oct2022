*** Settings ***
Library    demo.py


*** Test Cases ***
TC1
    Print Name

TC2
    ${res}    Add    10    10
    Log To Console     ${res} 


TC3
    ${path}     Get Driver Path    chrome
    Log To Console    ${path}