*** Settings ***
Library    RPA.Crypto


*** Test Cases ***
TC1
    ${key}    Generate Key
    Log To Console    ${key} 


    Use Encryption Key     ${key}
    ${en_password}    Encrypt String    pass
    Log To Console    ${en_password}