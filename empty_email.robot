*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BASE_URL}       http://localhost:7272/Form.html
${BROWSER}        Chrome

*** Test Cases ***
Verify Empty Email Displays Error
    Open Browser    ${BASE_URL}    ${BROWSER}
    [Teardown]      Close Browser

    Input Empty Email Data
    Submit Form
    Verify Empty Email Error

*** Keywords ***
Input Empty Email Data
    Input Text      id=firstname       Somsong
    Input Text      id=lastname        Sandee
    Input Text      id=destination     Europe
    Input Text      id=contactperson   Sodsai Sandee
    Input Text      id=relationship    Mother         
    Input Text      id=phone           081-111-1234

Submit Form
    Click Button    id=submitButton

Verify Empty Email Error
    Page Should Contain     Please enter an email!!