*** Settings ***
Library     SeleniumLibrary
Library    Collections
Library    String

Resource    ../Resources/KeywordDefinitionFiles/generic_keyword.robot

Test Setup  Open SauceDemo url
Test Teardown   Close SauceDemo

*** Test Cases ***

Sort Products By Price Low To High
    Login With Standard User

    Select From List By Label      css=.product_sort_container      Price (low to high)

    ${prices}=    Get WebElements    css=.inventory_item_price
    ${price_values}=    Create List

    FOR    ${element}    IN    @{prices}
        ${price_text}=    Get Text    ${element}
        ${price_text}=    Remove String    ${price_text}    $
        ${price}=    Convert To Number    ${price_text}
        Append To List    ${price_values}    ${price}
    END

    ${sorted}=    Evaluate    sorted($price_values)
    Lists Should Be Equal    ${price_values}    ${sorted}

Sort Products By Name Z To A
    Login With Standard User

    Select From List By Label   css=.product_sort_container     Name (Z to A)

    ${elements}=    Get WebElements    css=.inventory_item_name
    ${actual}=    Create List

    FOR    ${element}    IN    @{elements}
        ${name}=    Get Text    ${element}
        Append To List    ${actual}    ${name}
    END

    ${expected}=    Evaluate    sorted($actual, reverse=True)
    Lists Should Be Equal    ${actual}    ${expected}