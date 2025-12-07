*** Settings ***
Library    SeleniumLibrary
Resource    variables.resource

*** Variables ***
${BASE_URL}    https://www.hsl.fi/
${BROWSER}    chrome

*** Keywords ***
# Actions
Open Page HSL In Browser
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${btn_accept_coocies}

Click Element And Wait
    [Arguments]
    ...    ${element}
    Wait Until Keyword Succeeds    60    2    Click Element    ${element}

Accept All The Cookies
    Click Element And Wait    ${btn_accept_coocies}
    Check Element Is Not Available    ${btn_accept_coocies}

Insert Text
    [Arguments]
    ...    ${textfield}
    ...    ${text}
    Click Element    ${textfield}
    Wait Until Element Is Visible    ${textfield}
    Input Text    ${textfield}    ${text}
    Sleep    2
    Click Element    xpath=//div[contains(@class,"suggestion-item")][1]    # ensimmäinen ehdotus
    Log    Jippikaijee

#Checkings
Check Element Is Available
    [Arguments]
    ...    ${element}
    Wait Until Keyword Succeeds    60    2    Page Should Contain Element    ${element}

Check Element Is Not Available
    [Arguments]
    ...    ${element}
    Wait Until Keyword Succeeds    60    2    Element Should Not Be Visible    ${element}
    