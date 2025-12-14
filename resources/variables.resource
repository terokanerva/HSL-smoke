*** Variables ***
${BASE_URL}    https://www.hsl.fi/
${BROWSER}    chrome

${HSL_LOGO}    css=header
${BTN_ACCEPT_COOKIES}    xpath=//button[contains(.,'Hyväksy')]

${TXTFLD_FROM}    origin
${TXTFLD_TO}    destination

${ROUTE_RESULTS}    xpath=//*[contains(@class,"route") or contains(@class,"itinerary") or contains(@data-testid,"route")]

${SUGGESTION_ITEMS}    xpath=//div[contains(@class,"suggestion-item")]