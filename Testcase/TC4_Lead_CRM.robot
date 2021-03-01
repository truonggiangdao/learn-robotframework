*** Settings ***
Documentation     Test New Form
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      https://sg.younetsi.com/
${BROWSER}        Chrome

*** Test Cases ***
1. Valid Login Page
    Open Browser To Login Page
    Input Username    admin
    Input Password    demo@1234
    Submit Credentials
    Welcome Page Should Be Open
    Open CRM Lead

    Input Title     NguyentestLead
    Select Status   Mới
    Select Source   Call
    Input Lead Amount   2000
    Change Responsible  User2
    Submit Save

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
    Title Should Be    (9) Leads

Open CRM Lead
    click link      //*[@id="bx_left_menu_menu_crm_favorite"]/a
    click link    //*[@id="toolbar_lead_list_button_0_anchor"]/a

Input Title
    [Arguments]    ${title}
    Input text      TITLE   ${title}
Select Status
    select from list by value   //*[@id="lead_0_details_editor_container"]/form/div[1]/div[3]/div[2]/div[4]/div/div
Select Source
    select from list by value   //*[@id="lead_0_details_editor_container"]/form/div[1]/div[3]/div[3]/div[4]/div/div
Input Lead Amount
    [Arguments]    ${Lead_Amount}
    INPUT TEXT      UF_CRM_1606102115961_kf7ic_number   ${Lead_Amount}
Change Responsible
    click button    //*[@id="lead_0_details_editor_container"]/form/div[1]/div[3]/div[5]/div[4]/div/span[1]
    [Arguments]    ${search_user_responsible}
    input text      bx-dest-internal-input  ${search_user_responsible}
    click button    //*[@id="ASSIGNED_BY_ID_last_U9078"]/div[3]/div
Submit Save
    click button    /html/body/div[3]/div/button
Submit Cancel
    click button    /html/body/div[3]/div/a

