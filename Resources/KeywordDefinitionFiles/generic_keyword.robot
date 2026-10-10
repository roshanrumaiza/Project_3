*** Settings ***
Library    SeleniumLibrary

Variables      ../TestData/Test_data.py


*** Keywords ***

Open SauceDemo url
   ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-save-password-bubble
    &{prefs}=    Create Dictionary
    ...    credentials_enable_service=${False}
    ...    profile.password_manager_enabled=${False}
    ...    profile.password_manager_leak_detection=${False}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create WebDriver    Chrome    options=${options}
    Go To    ${URL}
    Maximize Browser Window
    Wait Until Element Is Visible    id=user-name    10s

Close SauceDemo
    Close All Browsers

Login To SauceDemo
    [Arguments]     ${username}     ${password}
    Input Text    id=user-name    ${username}
    Input Password    id=password   ${password}
    Click Button      id=login-button
    Sleep    1s

Login with Standard User
    Login To SauceDemo    ${USERNAME}    ${PASSWORD}
    Wait Until Page Contains    Products

Take Screenshot
    [Arguments]    ${name}
    Capture Page Screenshot    ${name}.png