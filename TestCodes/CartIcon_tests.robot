*** Settings ***
Library     SeleniumLibrary

Resource    ../Resources/KeywordDefinitionFiles/generic_keyword.robot

Test Setup  Open SauceDemo url
Test Teardown   Close SauceDemo

*** Test Cases ***

Verify CartIcon Visibility
    Login with Standard User
    Element Should Be Visible   xpath=//a[@class='shopping_cart_link']

Verify CartIcon Accessibility
    Login with Standard User
    Element Should Be Enabled    xpath=//a[@class='shopping_cart_link']