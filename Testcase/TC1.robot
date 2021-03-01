*** Settings ***
Documentation     Test login page in Site Saint Gobain
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://sg.younetsi.com/
${BROWSER}        Chrome

*** Test Cases ***
1. Valid Login
    Open Browser To Login Page
    Input Username    admin
    Input Password    @demo1234
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser
2. Invalid Login
    Open Browser To Login Page
    Input Username     123@
    Input Password  123
    Submit Credentials
    Login Page Should Be Fail
    [Teardown]    Close Browser
*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Authorization

Input Username
    [Arguments]    ${username}
    Input Text    USER_LOGIN    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    USER_PASSWORD    ${password}

Submit Credentials
    Click Button    //*[@id="login-popup"]/form/div[2]/input

Welcome Page Should Be Open
    Title Should Be    Authorization

Login Page Should Be Fail
    title should be     Authorization
    element should contain      //*[@id="login-popup"]/div[2]   Incorrect login or password
