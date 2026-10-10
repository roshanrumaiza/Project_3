*** Settings ***
Library     SeleniumLibrary
Library    Collections
Library     ../Libraries/ProductUtils.py

*** Keywords ***

Get All Product Names
    ${names}=   Get WebElements    css=.inventory_item_name
    ${product_names}=   Create List
    
    FOR    ${element}  IN  @{names}
        ${name}=    Get Text    ${element}
        Append To List  ${product_names}    ${name}
    END
    
    RETURN  ${product_names}
    

Get All Product Prices
    ${prices}=  Get WebElements    css=.inventory_item_price
    ${product_prices}=  Create List

    FOR     ${element}  IN  @{prices}
        ${price}=   Get Text    ${element}
        Append To List    ${product_prices}    ${price}
    END

    RETURN  ${product_prices}

Get All products with details
    ${names}=   Get All Product Names
    ${prices}=  Get All Product Prices
    ${products}=    Create List
    ${count}=    Get Length    ${names}

    FOR     ${index}    IN RANGE    ${count}
        ${name}=    Get From List    ${names}    ${index}
        ${price}=   Get From List     ${prices}    ${index}
        ${product}=     Create List     ${name}     ${price}
        Append To List    ${products}   ${product}
    END

    RETURN      ${products}

select four random products
    ${products}=  Get All products with details
    ${selected}=    Select Random Products    ${products}    4

    Log  selected_product:${selected}
    RETURN  ${selected}

Add to cart by name
    [Arguments]    ${product_name}
    ${locator}=    Set Variable    //div[contains(@class,'inventory_item')][.//div[contains(@class,'inventory_item_name') and text()='${product_name}']]//button
    Wait Until Element Is Visible    ${locator}    10s
    Click Element    ${locator}

Add selected product to the cart
    [Arguments]      ${selected_products}
#    Page Should Contain Element    css=.inventory_list
    FOR     ${Product}   IN      @{selected_products}
        ${name}=    Get From List    ${Product}    0
        Add to cart by name    ${name}
    END

Get Cart Badge Count
    ${exists}=    Run Keyword And Return Status    Page Should Contain Element    css=.shopping_cart_badge
    IF    ${exists}
        ${count}=    Get Text    css=.shopping_cart_badge
    RETURN    ${count}
    ELSE
    RETURN    ${0}
    END

Verify cart count
    [Arguments]     ${expected_count}
    ${actual_count}=    Get Cart Badge Count
    Should Be Equal As Integers    ${actual_count}    ${expected_count}

Open Cart
    Click Element    css=.shopping_cart_link
    Page Should Contain    Your Cart    10s

