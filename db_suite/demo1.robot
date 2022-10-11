*** Settings ***
Library         DatabaseLibrary

Suite Setup      Connect To Database     dbapiModuleName=pymysql
...                 dbName=dbfree_db
...                 dbUsername=dbfree_db
...                 dbPassword=12345678
...                 dbHost=db4free.net
...                 dbPort=3306

Suite Teardown    Run Keywords    Disconnect From Database    AND    Log To Console    End of test    

*** Test Cases ***
TC1
    ${row_count}    Row Count    select * from Products
    Log To Console    ${row_count}

TC2
    Row Count Is Equal To X    select * from Products    143
    Row Count Is Greater Than X    select * from Products    100
    Row Count Is 0    select * from Products where product_id=989899    
    Row Count Is Less Than X    select * from Products     200
    
TC3
   ${output}    Query    select * from Products where product_id<=15
   Log To Console    ${output}
   Log To Console    ${output}[0]

   Log To Console    ${output}[0][0]
   Log To Console    ${output}[0][1]
   Log To Console    ${output}[0][2]


#update, insert, delete 
TC4
    Execute Sql String    update Products set ProductName='watch' where product_id=1
    Row Count Is Equal To X    select * from Products where product_id=1 and ProductName='watch'    1

TC6
    Execute Sql String    Insert into Products (product_id,ProductName,description) values('2','Soundbar','sound sytem')
    ${output}    Query    select * from Products where product_id<=15
    Log To Console    ${output}

TC5
    # ${output}    Query    SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='dbfree_db'  AND TABLE_NAME='Products'
    # Log To Console    ${output}
    
    @{queryResults}	    Description	    SELECT * FROM Products
    Log to Console    ${queryResults}	


TC7
    ${output}    Query   selectStatement=update Products set ProductName='watch123' where product_id=2    sansTran=True
    Log To Console    ${output}

    ${output}    Query    selectStatement=select * from Products where product_id<=5    returnAsDict=True
    Log To Console    ${output}

    ${output}    Query    selectStatement=select * from Products where product_id<=5    returnAsDict=True
    Log To Console    ${output}[0]
    Log To Console    ${output}[0][ProductName]


