*** Settings ***
Library           SeleniumLibrary
Suite Teardown    Capture Page Screenshot

*** Variables ***
${BASE_URL}       http://localhost:7272/Form.html
${BROWSER}        Chrome
${FIRST_NAME}     Somsong
${LAST_NAME}      Sandee
${DESTINATION}    Europe
${CONTACTPERSON}  Sodsai Sandee
${RELATIONSHIP}   Mother
${EMAIL}          somsong@kkumail.com
${PHONE}          081-111-1234

*** Test Cases ***
Verify Form Submission Displays Completion Page
    Open Form
    Record Success

*** Keywords ***
Open Form
    Open Browser    ${BASE_URL}    ${BROWSER}
    Title Should Be    Customer Inquiry

Record Success
    Input Form Data
    Submit Form
    Verify Completion Page
    [Teardown]    Close Browser

Input Form Data
    Input Text      id=firstname       ${FIRST_NAME}
    Input Text      id=lastname        ${LAST_NAME}
    Input Text      id=destination     ${DESTINATION}
    Input Text      id=contactperson   ${CONTACTPERSON}
    Input Text      id=relationship    ${RELATIONSHIP}
    Input Text      id=email           ${EMAIL}
    Input Text      id=phone           ${PHONE}

Submit Form
    Click Button    id=submitButton
    Sleep           5s

Verify Completion Page
    Wait Until Page Contains    Completed
    Title Should Be             Completed
    Page Should Contain         Our agent will contact you shortly.
    Page Should Contain         Thank you for your patient.
