*** Settings ***
Library    SeleniumLibrary

Resource    ../Resources/KeywordDefinitionFiles/generic_keyword.robot
Resource    ../Resources/KeywordDefinitionFiles/Product_keyword.robot
Resource   ../Resources/KeywordDefinitionFiles/menu_keyword.robot

Test Setup       Open SauceDemo url
Test Teardown    Close SauceDemo


*** Test Cases ***

Reset App State After Adding Products
    Login With Standard User
    ${selected}=    Select Four Random Products
    Add selected product to the cart    ${selected}
    Verify Cart Count    4
    Reset Application State
    Verify Cart Is Empty