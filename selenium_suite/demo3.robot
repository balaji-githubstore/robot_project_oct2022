*** Settings ***
Resource    demo.resource
Library    OperatingSystem

*** Test Cases ***
TC1
    Launch Browser
    Go To    url=https://netbanking.hdfcbank.com/netbanking/

    Select Frame    xpath=//frame[@name='login_page']

    Input Text    name=fldLoginUserId    test123
    Click Element    link=CONTINUE

    Unselect Frame

TC2 Handling Alert
    Launch Browser
    Go To    url=https://netbanking.hdfcbank.com/netbanking/IpinResetUsingOTP.htm
    Click Element    xpath=//img[@alt='Go']

    ${alert_text}    Handle Alert    action=ACCEPT
    Log To Console    ${alert_text}
    Should Be Equal    ${alert_text}    Customer ID${SPACE}${SPACE}cannot be left blank.

TC3
    Launch Browser
    Go To    url=https://www.ilovepdf.com/pdf_to_word
    Choose File    xpath=//input[@type='file']    D:${/}Mine${/}Balaji-Profile.pdf
    Click Element    xpath=//span[text()='Convert to WORD']
    Click Element    partial link=Download WORD
    Sleep    5s
    File Should Exist    C:\\Users\\Balaji\\Downloads\\Balaji-Profile.docx




    