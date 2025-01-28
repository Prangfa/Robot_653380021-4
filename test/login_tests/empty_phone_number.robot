*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BASE_URL}       http://localhost:7272/Form.html
${BROWSER}        Chrome

*** Test Cases ***
Verify Empty Phone Number Displays Error
    Open Browser    ${BASE_URL}    ${BROWSER}
    [Teardown]      Close Browser

    Input Empty Phone Number Data
    Submit Form
    Verify Empty Phone Number Error

*** Keywords ***
Input Empty Phone Number Data
    Input Text      id=firstname       Somsong
    Input Text      id=lastname        Sandee
    Input Text      id=destination     Europe
    Input Text      id=contactperson   Sodsai Sandee
    Input Text      id=relationship    Mother
    Input Text      id=email           somsong@kkumail.com 

Submit Form
    Click Button    id=submitButton

Verify Empty Phone Number Error
    Page Should Contain     Please enter a phone number!!