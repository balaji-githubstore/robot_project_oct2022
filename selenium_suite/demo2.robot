*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Launch Browser
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    20s


*** Test Cases ***
TC1
    Launch Browser
    Go To    url=https://www.db4free.net/
    Click Element   partial link=phpMyAdmin
    Switch Window    phpMyAdmin
    Input Text    id=input_username    john
    Input Password    id=input_password    john123
    Click Element    id=input_go
    Element Should Contain    id=pma_errors    Access denied for user
    [Teardown]    Close Browser   

TC2
    Launch Browser
    Go To    url=https://www.db4free.net/
    Click Element   partial link=phpMyAdmin
    Switch Window    NEW
    Input Text    id=input_username    john
    Input Password    id=input_password    john123
    Click Element    id=input_go
    Element Should Contain    id=pma_errors    Access denied for user
    Switch Window    MAIN
    Log Title
    [Teardown]    Close Browser   




