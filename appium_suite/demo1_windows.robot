*** Settings ***
Library    AppiumLibrary

Test Teardown     Close Application

*** Test Cases ***
TC1
    Open Application    
    ...    remote_url=http://localhost:4723/wd/hub     
    ...    platformName=windows
    ...    app=C:\\WINDOWS\\system32\\notepad.exe

    ${source}    Get Source
    Log     ${source}

TC2
    Open Application    
    ...    remote_url=http://localhost:4723/wd/hub     
    ...    platformName=windows
    ...    app=C:\\WINDOWS\\system32\\notepad.exe
    Set Appium Timeout    10s
  
    Wait Until Page Contains Element    xpath=//*[@Name='File']
    Input Text    xpath=//*[@Name='Text Editor']    hello
    Click Element    xpath=//*[@Name='File']

    Wait Until Page Contains Element    xpath=//*[contains(@Name,'Save As')]
    Click Element    xpath=//*[contains(@Name,'Save As')]
    Input Text    xpath=//Edit[@Name='File name:']    D:${/}mine${/}temp.txt
    Click Element    xpath=//*[@Name='Save']
    Sleep    5s

TC3
    Open Application    
    ...    remote_url=http://localhost:4723/wd/hub     
    ...    platformName=windows
    ...    app=C:\\Users\\Balaji\\AppData\\Roaming\\Zoom\\bin\\Zoom.exe
    Set Appium Timeout    10s
  
    Wait Until Page Contains Element    xpath=//*[@Name='Sign In']
    
    Click Element    xpath=//*[@Name='Sign In']
    Sleep    1s
    Input Text    xpath=//*[contains(@Name,'your email')]    hhh@gmail.com
    Sleep    1s
    Click Element    xpath=//*[contains(@Name,'your password')]
    Input Text    xpath=//*[contains(@Name,'your password')]    welcome123
    Sleep    1s
    Click Element    xpath=//*[@Name='Sign In']
    
    Wait Until Page Contains Element    xpath=//*[contains(@Name,'Incorrect')]
    ${actual_error}    Get Element Attribute    xpath=//*[contains(@Name,'Incorrect')]    Name
    Log To Console    ${actual_error}

    Should Be Equal    ${actual_error}    Incorrect email or password
    Sleep    5s
