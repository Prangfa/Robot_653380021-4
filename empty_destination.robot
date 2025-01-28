*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BASE_URL}       http://localhost:7272/Form.html
${BROWSER}        Chrome
${EMPTY_DESTINATION} ""

*** Test Cases ***
Verify Empty Destination Displays Error
    Open Browser    ${BASE_URL}    ${BROWSER}
    [Teardown]      Close Browser

    Input Empty Destination Data
    Submit Form
    Verify Empty Destination Error

*** Keywords ***
Input Empty Destination Data
    Input Text      id=firstname       Somsong
    Input Text      id=lastname        Sandee
    Input Text      id=destination     ${EMPTY_DESTINATION}
    Input Text      id=contactperson   Sodsai Sandee
    Input Text      id=relationship    Mother
    Input Text      id=email           somsong@kkumail.com
    Input Text      id=phone           081-111-1234

Submit Form
    Click Button    id=submitButton

Verify Empty Destination Error
    Page Should Contain     Please enter your destination.