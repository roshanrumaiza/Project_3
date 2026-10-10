*** Settings ***
Library     SeleniumLibrary
Library    Collections

*** Keywords ***

Enter checkout details
    [Arguments]     ${Firstname}    ${lastname}     ${postalcode}
    Input Text    id=first-name    ${Firstname}
    Input Text    id=last-name    ${lastname}
    Input Text    id=postal-code    ${postalcode}
    Click Element    id=continue
    Wait Until Page Contains    Checkout: Overview

Verify Checkout Summary
    [Arguments]     ${selected_products}

    FOR   ${product}    IN   @{selected_products}
        ${name}=    Get From List    ${product}    0
        Page Should Contain    ${name}
    END


Capture checkout screenshot
    Capture Page Screenshot     checkout_summary.png

Finish Order
    Click Element    id=finish
    Wait Until Page Contains    Thank you for your order!    10s

Verify Order Confirmation
    Page Should Contain    Thank you for your order!
    Page Should Contain    Your order has been dispatched