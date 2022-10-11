*** Settings ***
Library     SeleniumLibrary
Library    DatabaseLibrary

*** Test Cases ***
TC1
    Open Browser
    ...    url=https://www.facebook.com/
    ...    browser=chrome
    ...    executable_path=D:${/}Software${/}chromedriver.exe
    Input Text    id=email    bala123456@gmail.com
    Input Password    id=pass    welcome123
    Click Element    name=login

TC2
    Open Browser    url=https://www.facebook.com/   alias=b1    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s

    Click Element    link=Create New Account
    Input Text    name=firstname    john
    Input Text    name=lastname    wick
    Input Text    name=reg_email__    bala123455@gmail.com
    Input Text    name=reg_email_confirmation__    bala123455@gmail.com
    Input Password    id=password_step_input    welcome123
    Select From List By Label    id=day    20
    Select From List By Label    id=month    Dec
    Select From List By Label    name=birthday_year    2000
    Click Element    xpath=//input[@value='-1']
    # click on sign up
    Click Element    name=websubmit
    
    Sleep    5s
    # Row Count Is Equal To X     select * from tbl_register where firstname='john'     1
    [Teardown]    Close Browser
 




*** Comments ***

TC2
    Open Browser    url=https://www.facebook.com/   alias=b1    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Open Browser    url=https://www.google.com/     alias=b2      browser=chrome       executable_path=D:${/}Software${/}chromedriver.exe

    Set Selenium Implicit Wait    20s
    # Switch Browser    b1
    Click Element    link=Create New Account
    Input Text    name=firstname    john
    #enter lastname 
    #enter phone number 80990
    #enter password as welcome123
 