*** Settings ***
Library     SeleniumLibrary
Resource    generic_keyword.robot


*** Keywords ***

Verify Login success
    Wait Until Page Contains    Products    10s
    Page Should Contain    Products

Verify Login Error
    [Arguments]     ${error_msg}
    Wait Until Element Is Visible    css=.error-message-container    10s
    Page Should Contain    ${error_msg}

Logout from SauceDemo
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    id=logout_sidebar_link     10s
    Click Element     id=logout_sidebar_link
    Wait Until Element Is Visible    id=login-button        10s
    Page Should Contain Element    id=login-button