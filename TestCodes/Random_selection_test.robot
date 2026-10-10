*** Settings ***
Library     SeleniumLibrary
Library     Collections
Library     ../Libraries/ProductUtils.py
Resource    ../Resources/KeywordDefinitionFiles/generic_keyword.robot
Resource    ../Resources/KeywordDefinitionFiles/Product_keyword.robot

Test Setup  Open SauceDemo url
Test Teardown   Close SauceDemo


*** Test Cases ***

Select random four products and display the details
    Login with Standard User
    ${selected}=    Select Four Random Products

    Log To Console    ==============================
    Log To Console    Selected Products
    Log To Console    ==============================

    FOR    ${product}    IN    @{selected}
        ${name}=     Get From List    ${product}    0
        ${price}=    Get From List    ${product}    1

        Log To Console    Product: ${name} | Price: ${price}
        Log    Product: ${name} | Price: ${price}
    END