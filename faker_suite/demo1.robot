*** Settings ***
Library    FakerLibrary

*** Test Cases ***
TC1
    ${output}    Credit Card Number
    Log To Console     ${output} 

    ${output}    Word
    Log To Console     ${output} 

    ${output}    Words    5
    Log To Console     ${output} 