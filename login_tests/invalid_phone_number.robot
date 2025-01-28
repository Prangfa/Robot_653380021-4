*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BASE_URL}       http://localhost:7272/Form.html
${BROWSER}        Chrome

*** Test Cases ***
Verify Invalid Phone Number Displays Error
    Open Browser    ${BASE_URL}    ${BROWSER}
    [Teardown]      Close Browser

    Input Invalid Phone Number Data
    Submit Form
    Verify Invalid Phone Number Error

*** Keywords ***
Input Invalid Phone Number Data
    Input Text      id=firstname       Somsong
    Input Text      id=lastname        Sandee
    Input Text      id=destination     Europe
    Input Text      id=contactperson   Sodsai Sandee
    Input Text      id=relationship    Mother
    Input Text      id=email           somsong@kkumail.com
    Input Text      id=phone           191

Submit Form
    Click Button    id=submitButton

Verify Invalid Phone Number Error
    Page Should Contain     Please enter a valid phone number!!