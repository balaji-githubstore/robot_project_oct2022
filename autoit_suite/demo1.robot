*** Settings ***
Resource    ../selenium_suite/demo.resource

Library    AutoItLibrary

# http://Username:Password@SiteURL
*** Test Cases ***
TC1
    Launch Browser
    Go To    url=http://john:john123@softwaretesting.com/


TC2
    Launch Browser
    Go To    url=http://softwaretesting.com/
    Sleep    2s
    Send    john
    Send    {TAB}
    Send    welcome123
    Send    {ENTER}

TC3
    Launch Browser
    Go To    url=https://www.ilovepdf.com/pdf_to_word
    Click Element    id=pickfiles
    Sleep    4s
    Control Focus    Open    ${EMPTY}    Edit1
    Control Set Text    Open    ${EMPTY}    Edit1    D:${/}Mine${/}Balaji-Profile.pdf
    AutoItLibrary.Control Click    Open    ${EMPTY}    Button1
 


