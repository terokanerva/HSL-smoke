*** Settings ***
Documentation    HSL Smoke Test verifies key UI flows load correctly

Resource    ../resources/variables.resource
Resource    ../resources/hsl_keywords.resource

Suite Setup    Open Page HSL In Browser
Suite Teardown    Close Browser

*** Test Cases ***
HSL Web Page Smoke Test
    Main Page Is Open
    Search Route    from_to=Pakkamestarinkatu 1    where_to=Rauskumäki 3
    Validate Search Result    select_route=${ROUTE_RESULTS}    result_element=${ROUTE_RESULTS}