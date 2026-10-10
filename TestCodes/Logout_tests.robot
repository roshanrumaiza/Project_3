*** Settings ***
Library     SeleniumLibrary

Resource    ../Resources/KeywordDefinitionFiles/generic_keyword.robot
Resource    ../Resources/KeywordDefinitionFiles/login_keyword.robot

Variables   ../Resources/TestData/Test_data.py

Test Setup  Open SauceDemo url
Test Teardown   Close SauceDemo

*** Test Cases ***

Validate Logout functionality
    Login with Standard User
    Logout from SauceDemo