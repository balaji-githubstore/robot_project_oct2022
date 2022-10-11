*** Settings ***
Library    DateTime

*** Test Cases ***
TC1
    Log To Console    Balaji Dinakaran

TC2
    Log To Console    bala

TC3
    ${session_name}    Set Variable    robot session
    Log To Console    ${session_name}
    
TC5
    ${radius}    Set Variable    10
    ${result}    Evaluate     3.14*${radius}*${radius}
    Log To Console     The result is ${result}

TC6
    ${date}    Get Current Date
    Log    ${date}

TC4
   ${var1}    ${var2}    Set Variable    user    name
   Log To Console    Value is ${var1} ${var2}
   Log To Console    Value is ${var1} ${var2}
   Log To Console    Value is ${var1} ${var2}

