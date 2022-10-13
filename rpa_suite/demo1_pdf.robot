*** Settings ***
Library    RPA.PDF
Library    Collections

*** Test Cases ***
TC1
    ${page_count}    Get Number Of Pages    source_path=D:${/}Mine${/}Balaji-Profile.pdf
    Log To Console    ${page_count} 

TC2
    ${res}    Get Text From Pdf    source_path=D:${/}Mine${/}Balaji-Profile.pdf    pages=1
    Log     ${res}
    ${page1}    Convert To Integer    1
    Log     ${res}[${page1}]
    
    ${content}    Get From Dictionary    ${res}    ${page1} 
    Log To Console    ${content}

TC3
    ${res}    Get Text From Pdf    source_path=D:${/}Mine${/}Balaji-Profile.pdf
    Log     ${res}

TC4   
    Open Pdf    source_path=D:${/}Mine${/}Balaji-Profile.pdf

    ${page_count}    Get Number Of Pages
    Log To Console    ${page_count}
