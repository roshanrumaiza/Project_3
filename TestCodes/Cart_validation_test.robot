*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../Resources/KeywordDefinitionFiles/generic_keyword.robot
Resource    ../Resources/KeywordDefinitionFiles/Product_keyword.robot
Resource    ../Resources/KeywordDefinitionFiles/Cart_keyword.robot

Test Setup  Open SauceDemo url
Test Teardown   Close SauceDemo

*** Test Cases ***

Validate products in the cart
    Login With Standard User
    ${selected}=    Select Four Random Products
    Add selected product to the cart    ${selected}
    Verify Cart Count    4

    Open Cart

    Verify Cart Product Count    4
    Verify Cart Contains Selected Products    ${selected}
    
    Log To Console    Validation of selected product in the cart is successful