*** Settings ***
Library     SeleniumLibrary
Library     Collections

Resource    ../Resources/KeywordDefinitionFiles/generic_keyword.robot
Resource    ../Resources/KeywordDefinitionFiles/Product_keyword.robot

Test Setup  Open SauceDemo url
Test Teardown   Close SauceDemo

*** Test Cases ***

Add Selected Product To The Cart
    Login With Standard User
    ${selected}=    Select Four Random Products

    Log To Console    Selected products: ${selected}

    Add selected product to the cart    ${selected}
    Verify Cart Count    4

    Log To Console    Successfully added 4 products to the cart