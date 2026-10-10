*** Settings ***
Library     SeleniumLibrary

Resource    ../Resources/KeywordDefinitionFiles/generic_keyword.robot
Resource    ../Resources/KeywordDefinitionFiles/login_keyword.robot

Variables      ../Resources/TestData/Test_data.py

Test Setup  Open SauceDemo url
Test Teardown   Close SauceDemo

*** Test Cases ***

Login with Invalid Username
    Login To SauceDemo    ${INVALID_USER}    ${PASSWORD}
    Verify Login Error    Epic sadface: Username and password do not match any user in this service
    
    
Login with Invalid Password
    Login To SauceDemo    standard_user    ${INVALID_PASSWORD}
    Verify Login Error    Epic sadface: Username and password do not match any user in this service
    
    
Login with Invalid Username and Invalid credentials
    Login To SauceDemo    ${INVALID_USER}   ${INVALID_PASSWORD}
    Verify Login Error    Epic sadface: Username and password do not match any user in this service
    
Login with Empty Username
    Input Password    id=password    ${PASSWORD}
    Click Button    id=login-button
    Verify Login Error    Epic sadface: Username is required
    
Login with Empty Password
    Input Text    id=user-name      standard_user
    Click Button    id=login-button
    Verify Login Error    Epic sadface: Password is required