*** Settings ***
Library     SeleniumLibrary
Library     Collections

*** Keywords ***

#Keyword to get all the product names in the product page
Get cart product names
    ${names}=    Get WebElements    css=.cart_item .inventory_item_name
    ${Cart_product_names}=    Create List

    FOR    ${element}    IN    @{names}
        ${name}=    Get Text    ${element}
        Append To List    ${Cart_product_names}    ${name}
    END

    RETURN    ${Cart_product_names}

#keyword to get all the product price in the product page
Get cart product prices
    ${prices}=    Get WebElements    css=.cart_item .inventory_item_price
    ${cart_product_prices}=    Create List

    FOR    ${element}    IN    @{prices}
        ${price}=    Get Text    ${element}
        Append To List    ${cart_product_prices}    ${price}
    END

    RETURN    ${cart_product_prices}

#this keyword expects one value in the test page
Verify Cart contains selected products
    [Arguments]     ${selected_product}

    ${cart_products}=   Get cart product names
    FOR    ${product}    IN    @{selected_product}
        #get only the product name from the list ${product} that is at the 0 th index
        ${expected_name}=   Get From List    ${product}    0
        List Should Contain Value    ${cart_products}    ${expected_name}
    END


Verify Cart product count
    [Arguments]     ${expected_count}
    
    ${cart_items}=  Get WebElements    css=.inventory_item_name
    ${actual_count}=    Get Length    ${cart_items}
    Should Be Equal As Integers    ${actual_count}    ${expected_count}

Continue to Checkout
    Click Element    id=checkout
    Wait Until Page Contains    Checkout: Your Information    10s