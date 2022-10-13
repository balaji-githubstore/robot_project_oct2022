*** Settings ***
Library    RPA.JSON

*** Test Cases ***
TC1
    &{json}    Load JSON from file    ${EXECDIR}${/}files${/}data.json
    Log To Console    ${json}
    Log To Console    ${json}[browser]
    Log To Console    ${json.browser}
    Log To Console    ${json['browser']}
    Log To Console    ${json.validcredentialtestdata}
    Log To Console    ${json.validcredentialtestdata[0]}
    Log To Console    ${json.validcredentialtestdata[0][0]}
    Log To Console    ${json}[validcredentialtestdata][0][0]

TC2
    &{json}    Load JSON from file    ${EXECDIR}${/}files${/}data.json
    ${value}    Get value from JSON    ${json}    browser
    Log To Console    ${value}

TC3
    &{json}    Load JSON from file    ${EXECDIR}${/}files${/}data.json
    Update value to JSON    ${json}    browser    chrome
    Log To Console    ${json}
    Save JSON to file    ${json}    ${EXECDIR}${/}files${/}data1.json

    
