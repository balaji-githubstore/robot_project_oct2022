*** Settings ***
Library    RPA.Excel.Files

*** Test Cases ***
TC1
    Open Workbook    path=D:${/}openemr_data.xlsx
    @{sheetnames}    List Worksheets
    Log To Console    ${sheetnames}

    FOR    ${sheetname}    IN    @{sheetnames}
        Log To Console     ${sheetname} 
    END

TC2
    Open Workbook    path=D:${/}openemr_data.xlsx
    ${sheet}    Read Worksheet    VerifyValidCredential
    Log To Console    ${sheet}
    Log     ${sheet}
    #row index starts at 0 because it's a list of dictionaries 
    Log To Console    ${sheet}[1]
    Log To Console    ${sheet}[1][A]

    Log To Console    ${sheet}[2][C]

TC3
    Open Workbook    path=D:${/}openemr_data.xlsx
    ${sheet}    Read Worksheet    VerifyValidCredential

    ${row_count}    Get Length    ${sheet}
    Log To Console    ${row_count} 

    ${col_count}    Get Length    ${sheet}[0]
    Log To Console    ${col_count} 

    #row index (row number) starts at 1
    ${cell}    Get Cell Value    1    1
    Log To Console    ${cell} 

    ${cell}    Get Cell Value    1    A
    Log To Console    ${cell} 

    [Teardown]    Close Workbook

TC4
    Open Workbook    path=D:${/}openemr_data.xlsx
    ${sheet}    Read Worksheet    VerifyValidCredential
    Set Cell Value    1    1    hello
    Save Workbook
    