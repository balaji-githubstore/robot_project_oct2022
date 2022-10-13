*** Settings ***
Library    SeleniumLibrary
Library    RPA.Crypto

*** Variables ***
${KEY}    186TrJ_Kog9mRxL9b8jTNPPl-rL1qj91uolGOb7oHHk=
${EN_PASSWORD}    gAAAAABjR7qGE7h8DVrU6SosVncYh9ChPu4snqDFZSB0vnL645eYrdWVm1trZhk2husKc693AgJx2hOCzUFZe6q0RA1pvCsjzw==

*** Keywords ***
Get Password
    Use Encryption Key    ${key}
    ${text}    Decrypt string    ${EN_PASSWORD}
    Return From Keyword    ${text}
    
*** Test Cases ***
TC1
    Set Log Level    NONE
    ${text}    Get Password
    Set Log Level    INFO

    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    Go To    url=https://demo.openemr.io/b/openemr
    Input Text    id=authUser    admin
    Input Password    id=clearPass    ${text}
    Press Keys    NONE    ENTER
    