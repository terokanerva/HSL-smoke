*** Settings ***
Documentation    HSL Smoke Test verifies key UI flows load correctly

Resource    ../resources/variables.resource
Resource    ../resources/hsl_keywords.resource

Suite Setup    Open Page HSL In Browser
Suite Teardown    Close Browser

*** Variables ***
${from_to}    Pakkamestarinkatu 1
${where_to}    Rauskumäki 3

${select_route}    xpath=//*[@id="mainContent"]//div[@class="summary-clickable-area"]

*** Test Cases ***
Open HSL Front Page And Accept Coocies
    Accept All The Cookies

Main Page Is Open
    Check Element Is Available    ${hsl_logo}

Search Route
    Insert Text    ${txt_fld_from}    ${from_to}
    Insert Text    ${txt_fld_to}    ${where_to}

Validate Search Result
    Check Element Is Available    ${select_route}
    Click Element And Wait    ${select_route}
    Sleep    5
    Page Should Contain    text=Kävele
