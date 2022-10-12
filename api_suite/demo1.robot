*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem

*** Keywords ***
Get Auth Code 
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    POST On Session    alias=petshop   url=/pet   
    Log To Console    ${response}[code]
    [Return]    ${response}[code]
    

*** Test Cases ***
TC1
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    GET On Session    alias=petshop    url=pet/102
    Log To Console    ${response}
    Log To Console    ${response.json()}
    Log    ${response}
    Log    ${response.json()}
    Log To Console    ${response.json()}[id]
    Log To Console    ${response.json()}[name]
    
    Should Be Equal    ${response.json()}[name]    doggie

TC2 Find Valid Pet Detail
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    GET On Session    alias=petshop    url=pet/801
    Status Should Be    200
    Should Be Equal    ${response.json()}[name]    doggie-801
    Should Be Equal As Numbers    ${response.json()}[id]    801

TC3 Find Invalid Pet Detail
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    GET On Session    alias=petshop    url=pet/1002     expected_status=any 
    
    Log To Console    ${response.json()}
    Log To Console    ${response.json()}[message]
    
    # ${output}     Run Keyword And Ignore Error  Status Should Be    404
    # Run Keyword And Ignore Error  Status Should Be    500
    Status Should Be    404
    # Status Should Be    500
    Should Be Equal    ${response.json()}[message]    Pet not found
    

TC4 Find By Status
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    GET On Session    alias=petshop    url=pet/findByStatus?status=sold
    Log    ${response.json()}    
    Log    ${response.json()}[0] 
    Status Should Be    200

TC5 Add Pet to Store 
    &{header}    Create Dictionary    Content-Type=application/json        
    
    ${json}    Get Binary File    path=${EXECDIR}${/}api_suite${/}pet.json

    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    POST On Session    alias=petshop   url=/pet    headers=${header}        data=${json}
    Log To Console    ${response}
    Log To Console    ${response.json()}
    Log    ${response}
    Log    ${response.json()}

TC6
    Create Session    alias=petshop    url=https://petstore.swagger.io/v2
    ${response}    GET On Session    alias=petshop    url=pet/801
    Log To Console    ${response.json()}
    Log To Console    ${response.json()}[category]
    Log To Console    ${response.json()}[category][id]

    

