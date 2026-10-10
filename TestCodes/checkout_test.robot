*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource    ../Resources/KeywordDefinitionFiles/generic_keyword.robot
Resource    ../Resources/KeywordDefinitionFiles/Product_keyword.robot
Resource    ../Resources/KeywordDefinitionFiles/Cart_keyword.robot
Resource    ../Resources/KeywordDefinitionFiles/Checkout_keyword.robot

Test Setup  Open SauceDemo url
Test Teardown   Close SauceDemo

*** Test Cases ***

Complete the checkout
    Login With Standard User
    ${selected}=    Select Four Random Products

    Log To Console    selected product for checkout: ${selected}

    Add selected product to the cart    ${selected}
    Verify Cart Count    4

    Open Cart

    Verify Cart Product Count    4
    Verify Cart Contains Selected Products    ${selected}

    Continue To Checkout

    Enter checkout details  Roshan      Rumaiza     575001
    Verify Checkout Summary    ${selected}
    Capture Checkout Screenshot
    Finish Order
    Verify Order Confirmation