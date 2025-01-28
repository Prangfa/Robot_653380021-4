*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BASE_URL}       http://localhost:7272/Form.html
${BROWSER}        Chrome 
*** Test Cases ***
Verify Invalid Email Displays Error
    Open Browser    ${BASE_URL}    ${BROWSER}
    [Teardown]      Close Browser

    Input Invalid Email Data
    Submit Form
    Verify Invalid Email Error

*** Keywords ***
Input Invalid Email Data
    Input Text      id=firstname       Somsong
    Input Text      id=lastname        Sandee
    Input Text      id=destination     Europe
    Input Text      id=contactperson   Sodsai Sandee
    Input Text      id=relationship    Mother
    Input Text      id=email           somsong@
    Input Text      id=phone           081-111-1234

Submit Form
    Click Button    id=submitButton

Verify Invalid Email Error
    Page Should Contain     Please enter a valid email!!