*** Keywords ***
Print My Name
    Log To Console    FirstName: Balaji
    Log To Console    LastName: Dinakaran

Calculate Area Of Circle 
    [Arguments]    ${rad}
    ${output}    Evaluate     3.14*${rad}*${rad}
    [Return]    ${output}


Calculate Area Of Circle2
    [Arguments]    ${rad}
    ${output}    Evaluate     3.14*${rad}*${rad}
    Return From Keyword    ${output}

*** Test Cases ***
TC1
    Print My Name

TC2
   ${res}     Calculate Area Of Circle    10
   Log To Console    ${res}
    
TC3
   ${res}     Calculate Area Of Circle2    10
   Log To Console    ${res}
    
TC4
   ${res}    Calculate Area Of Circle    10
#    ${expected_output}    Convert To Integer    314
#    Should Be Equal    ${expected_output}    ${res}
   Should Be Equal As Numbers    ${res}    314

TC5
    [Template]    Print My Name

TC6
    [Template]    Calculate Area Of Circle    
    45

TC6
    [Template]    Calculate Area Of Circle    
    50