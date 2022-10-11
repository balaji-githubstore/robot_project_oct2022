*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Launch Browser
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
