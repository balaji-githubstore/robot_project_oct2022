*** Settings ***
Resource    demo.resource
Library     OperatingSystem
Library     Collections


*** Test Cases ***
TC1
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.online.citibank.co.in/

    Run Keyword And Ignore Error    Click Element    xpath=//a[@title='Close']
    Click Element    xpath=//span[text()='Login']
    Switch Window    NEW
    Click Element    xpath=//div[contains(text(),'Forgot User')]
    Click Element    link=select your product type
    Click Element    link=Credit Card
    Input Text    css=#citiCard1    7887
    # Input Text    id=bill-date-long    03/05/2000
    Execute Javascript    document.querySelector("[name='DOB']").value='05/06/2000'

TC2
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.online.citibank.co.in/

    Run Keyword And Ignore Error    Click Element    xpath=//a[@title='Close']
    Click Element    xpath=//span[text()='Login']
    Switch Window    NEW
    Click Element    xpath=//div[contains(text(),'Forgot User')]
    Click Element    link=select your product type
    Click Element    link=Credit Card
    Input Text    css=#citiCard1    7887
    # Input Text    id=bill-date-long    03/05/2000
    Assign Id To Element    xpath=//input[@value='dd/mm/yyyy']    id=date
    Execute Javascript    document.querySelector("#date").value='05/06/2000'

TC3
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    10s
    Go To    url=https://www.online.citibank.co.in/

    Run Keyword And Ignore Error    Click Element    xpath=//a[@title='Close']
    Click Element    xpath=//span[text()='Login']
    Switch Window    NEW
    Click Element    xpath=//div[contains(text(),'Forgot User')]
    Click Element    link=select your product type
    Click Element    link=Credit Card
    Input Text    css=#citiCard1    7887
    # Input Text    id=bill-date-long    03/05/2000

    ${ele}    Get WebElement    xpath=//input[@value='dd/mm/yyyy']
    Execute Javascript    arguments[0].value='05/06/2000'    ARGUMENTS    ${ele}

TC4
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    Go To    url=https://nasscom.in/
    Mouse Over    xpath=//a[text()='Membership']
    Click Element    xpath=//a[text()='Members Listing']

TC5
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    Go To    url=https://nasscom.in/

    ${ele}    Get WebElement    xpath=//a[text()='Members Listing']
    Execute Javascript    arguments[0].click()    ARGUMENTS    ${ele}

TC6
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    Go To    url=https://nasscom.in/

    ${ele}    Get WebElement    xpath=//a[text()='Members Listing']
    ${ele1}    Get WebElement    xpath=//a[text()='Members Listing']
    Execute Javascript    arguments[0].click();arguments[1].click()    ARGUMENTS    ${ele}    ${ele1}

TC7
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    Go To    url=https://www.youtube.com/watch?v=5FUdrBq-WFo
    Sleep    5s
    ${output}    Execute Javascript
    ...    return document.querySelectorAll("[class='video-stream html5-main-video']")[0].duration
    Log To Console    ${output}

TC8
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    Go To    url=https://www.selenium.dev/downloads/
    Click Element    link=32 bit Windows IE
    Sleep    5s
    File Should Exist    C:${/}Users${/}Balaji${/}Downloads${/}IEDriverServer_Win32_4.5.0.zip

TC9 Get System username
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    Go To    url=https://www.selenium.dev/downloads/
    Click Element    link=32 bit Windows IE
    Sleep    5s
    ${username}    Get Environment Variable    Username
    File Should Exist    C:${/}Users${/}${username}${/}Downloads${/}IEDriverServer_Win32_4.5.0.zip

TC10 DownloadDirectoryChangeForSession
    &{prefs}    Create Dictionary    download.default_directory=${EXECDIR}${/}files
    Open Browser
    ...    browser=chrome
    ...    executable_path=D:${/}Software${/}chromedriver.exe
    ...    options=add_experimental_option("prefs",${prefs})

    Maximize Browser Window
    Set Browser Implicit Wait    20
    Go To    url=https://www.selenium.dev/downloads/
    Click Element    link=32 bit Windows IE

TC11 Notification hide
    Open Browser
    ...    browser=chrome
    ...    executable_path=D:${/}Software${/}chromedriver.exe
    ...    options=add_argument('--disable-notifications')
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    Go To    url=https://www.irctc.co.in/nget/train-search

TC12 Download Name
    &{prefs}    Create Dictionary    download.default_directory=${EXECDIR}${/}files
    Open Browser
    ...    browser=chrome
    ...    executable_path=D:${/}Software${/}chromedriver.exe
    ...    options=add_experimental_option("prefs",${prefs})

    Maximize Browser Window
    Set Browser Implicit Wait    20
    Go To    url=https://www.selenium.dev/downloads/
    Click Element    link=32 bit Windows IE

    Go To    url=chrome://downloads/
    ${output}    Execute Javascript
    ...    return document.querySelector("body > downloads-manager").shadowRoot.querySelector("#frb0").shadowRoot.querySelector("#file-link").innerText
    Log To Console    ${output}

TC13
    Open Browser
    ...    browser=chrome
    ...    executable_path=D:${/}Software${/}chromedriver.exe
    Go To    url=https://demo.guru99.com/test/drag_drop.html
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//a[contains(text(),'BANK')]
    Drag And Drop    xpath=//a[contains(text(),'BANK')]    xpath=//div[@class='ui-widget-content']/ol

TC14
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    Go To    url=https://www.google.com
    @{elements}    Get Webelements    xpath=//a
    Log List    ${elements}

    ${text}    Get Text    ${elements}[0]
    Log To Console    ${text}

    ${href}    Get Element Attribute    ${elements}[0]    href
    Log To Console    ${href}

TC14
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    Go To    url=https://www.google.com
    @{elements}    Get Webelements    xpath=//a
    Log List    ${elements}

    ${count}    Get Element Count    xpath=//a

    FOR    ${i}    IN RANGE    0    ${count}
        ${text}    Get Text    ${elements}[${i}]
        Log To Console    ${text}

        ${href}    Get Element Attribute    ${elements}[${i}]    href
        Log To Console    ${href}
    END

TC15
    Open Browser    browser=chrome    executable_path=D:${/}Software${/}chromedriver.exe
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    Go To    url=https://www.google.com
    @{elements}    Get Webelements    xpath=//a
   
    FOR    ${element}    IN    @{elements}
        ${text}    Get Text    ${element}
        Log To Console    ${text}

        ${href}    Get Element Attribute    ${element}   href
        Log To Console    ${href}
    END

   
