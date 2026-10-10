*** Settings ***
Library     SeleniumLibrary
Library    BuiltIn


*** Keywords ***


Open Side Menu
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    id=inventory_sidebar_link    5s


Reset Application State
    Open Side Menu
    Click Element    id=reset_sidebar_link


Verify Cart Is Empty
    ${exists}=    Run Keyword And Return Status    Page Should Contain Element    css=.shopping_cart_badge
    Run Keyword If    ${exists}    Fail    Cart is not empty.