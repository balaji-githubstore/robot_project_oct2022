*** Settings ***
Resource    demo.resource


*** Test Cases ***
TC1
    Launch Browser
    Go To    url=https://phptravels.net/
    Click Element    id=tours-tab
    # Input Text    id=departure    30-10-2022
    Execute Javascript    document.getElementById('date').value='05-11-2022'

TC2
    Launch Browser
    Go To    url=https://phptravels.net/
    Click Element    id=tours-tab
    # Input Text    id=departure    30-10-2022
    Execute Javascript    document.querySelector('#date').value='05-11-2022'

TC3
    Launch Browser
    Go To    url=https://phptravels.net/
    Click Element    id=tours-tab
    # Input Text    id=departure    30-10-2022
    Execute Javascript    document.querySelector("input[id='date']").value='06-11-2022'

TC4
    Launch Browser
    Go To    url=https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
    Assign Id To Element    xpath=//input[@placeholder='Username']    user
    Execute Javascript    document.querySelector("#user").value='06-11-2022'

TC5
    Launch Browser
    Go To    url=https://www.irctc.co.in/nget/train-search
    Run Keyword And Ignore Error    Click Element    xpath=//button[text()='OK']

TC6
    Launch Browser
    Go To    url=https://www.irctc.co.in/nget/train-search
    Run Keyword And Ignore Error    Click Element    xpath=//button[text()='OK']

TC7
    Launch Browser
    Go To    url=https://www.irctc.co.in/nget/train-search
    ${output}    Run Keyword And Ignore Error    Click Element    xpath=//button[text()='OK12']
    Log To Console    ${output}

TC8
    Launch Browser
    Go To    url=https://www.irctc.co.in/nget/train-search

    FOR    ${i}    IN RANGE    1    99
        ${output}    Run Keyword And Ignore Error    Click Element    xpath=//button[text()='OK']
        Log To Console    ${output}
        Exit For Loop If    '${output}[0]'=='PASS'
    END

    
