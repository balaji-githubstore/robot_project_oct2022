*** Settings ***
Library     Collections


*** Variables ***
${MY_NAME}          Balaji Dinakaran
@{COLORS}           red    green    yellow
@{COLORS2}          red    green    yellow    pink
&{MY_RECORDS}       name=Balaji    role=trainer    mobile=7888878


*** Test Cases ***
TC1
    Log To Console    ${COLORS2}

TC2
    Log To Console    ${MY_NAME}

TC3
    Log To Console    ${COLORS}
    Log To Console    ${COLORS}[0]
    ${list_size}    Get Length    ${COLORS}
    Log To Console    ${list_size}

TC4
    Log To Console    ${COLORS}

TC5
    @{fruits}    Create List    apple    orange    grapes
    List Should Contain Value    ${fruits}    orange

TC6
    @{fruits}    Create List    apple    orange    grapes
    Log To Console    ${fruits}
    Append To List    ${fruits}    mango
    Log To Console    ${fruits}​​
    # Remove From List    ${fruits}    0
    Remove Values From List    ${fruits}    apple
    Log To Console    ${fruits}​​
    Insert Into List    ${fruits}    0    kiwi
    Log To Console    ${fruits}​​

TC7
    Log To Console    ${MY_RECORDS}
    Log To Console    ${MY_RECORDS}[role]
    Log To Console    ${MY_RECORDS}[mobile]

    &{emp_record}    Create Dictionary    empid=101    empname=john

    # Log To Console    ${emp_record}

    # ${num}    Convert To Integer    ${MY_RECORDS}[mobile]

    # ${res}    Evaluate    ${num}+ ${num}
    # Log To Console    ${res}

TC8
    FOR    ${i}    IN RANGE    1    11
        Log To Console    ${i}
    END

TC9
    @{fruits}    Create List    apple    orange    grapes    pineapple
    #use for loop to print value one by one from list
    ${size}    Get Length    ${fruits}
    Log To Console    ${size}

    FOR    ${i}    IN RANGE    0    ${size}
        Log To Console    ${fruits}[${i}]
    END

TC10
    @{fruits}    Create List    apple    orange    grapes    pineapple

    FOR    ${val}    IN    @{fruits}
        Log To Console    ${val}
    END

TC11
    ${num}    Set Variable    -10

    IF    ${num}<0
        Log To Console    Negative
    ELSE IF  ${num}==0
        Log To Console    ZERO
    ELSE
        Log To Console    Positive
    END
