*** Settings ***
Library    SSHLibrary
# Library    OperatingSystem

*** Test Cases ***
TC1
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    ${files}    List Files In Directory    path=C:\\mine
    Log To Console    ${files}
    Get File    source=C:\\mine\\dp.jpg    destination=D:\\mine\\dp.jpg

    # OperatingSystem.File Should Exist    D:\\mine\\dp.jpg
    



TC2
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    ${output}    Execute Command    python --version
    Log To Console    ${output}


TC3
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    ${output}    Execute Command    appium -p 9878
    Log To Console    ${output}

TC4
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    ${output}    Execute Command    git --version
    Log To Console    ${output}

TC5
    Open Connection    host=192.168.1.7    port=22
    Login    username=jidi    password=123456
    ${output}    Execute Command    dir
    Log To Console    ${output}

TC6
    Open Connection    host=192.168.1.7    port=22     alias=m1
    Login    username=jidi    password=123456
    ${files}    List Files In Directory    path=C:\\mine
    Log To Console    ${files}
    Put File      source=D:\\mine\\dp.jpg    destination=C:\\mine\\dp.jpg 

    Open Connection    host=192.168.1.7    port=22     alias=m2
    Login    username=jidi    password=123456

    Switch Connection    m1