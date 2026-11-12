*** Settings ***
Library    SeleniumLibrary
Resource    variables.resource

*** Keywords ***
# Actions
Open Page HSL In Browser
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    10s
    Set Selenium Implicit Wait    0s
    Wait Until Page Contains Element    ${HSL_LOGO}    15s

Click Element And Wait
    [Arguments]
    ...    ${element}
    ...    ${timeout}=15s
    Wait Until Element Is Visible    ${element}    ${timeout}
    Click Element    ${element}

Accept All The Cookies If Present
    ${present}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${BTN_ACCEPT_COOKIES}    6s
    IF    ${present}
        Click Element And Wait    ${BTN_ACCEPT_COOKIES}
        Run Keyword And Ignore Error    Wait Until Element Is Not Visible    ${BTN_ACCEPT_COOKIES}    5s
    END

Insert Text And Confirm With Enter
    [Arguments]    ${textfield}    ${text}
    Wait Until Element Is Visible    ${textfield}    10s
    Click Element    ${textfield}
    Press Keys    ${textfield}    CTRL+A
    Press Keys    ${textfield}    BACKSPACE
    Input Text    ${textfield}    ${text}

    Wait Until Page Contains Element    ${SUGGESTION_ITEMS}    10s
    Press Keys    ${textfield}    ENTER

#Checkings
Check Element Is Available
    [Arguments]
    ...    ${element}
    Wait Until Element Is Visible    ${element}

Check Element Is Not Available
    [Arguments]
    ...    ${element}
    Wait Until Element Is Not Visible    ${element}

Check Text
    [Arguments]
    ...    ${text}
    Wait Until Page Contains    ${text}

Main Page Is Open
    Accept All The Cookies If Present
    Check Element Is Available    ${HSL_LOGO}

Search Route
    [Arguments]
    ...    ${from_to}
    ...    ${where_to}
    Insert Text And Confirm With Enter    ${TXTFLD_FROM}    ${from_to}
    Insert Text And Confirm With Enter    ${TXTFLD_TO}    ${where_to}

Validate Search Result
    [Arguments]
    ...    ${select_route}
    ...    ${result_element}
    Click Element And Wait    ${select_route}
    Page Should Contain Element    ${result_element}
    