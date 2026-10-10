# SAUCE_DEMO_Automated_Robot_Framework_Testing_Project

The objective of this project is automating the testing of SAUCE_DEMO website using **Python**+**Robot Framework** +** SaleniumLibraray**.
This project focuses on end-to-end automation testing, including login validation, product selection, cart operations, checkout validation, sorting of products and reset app state.

##  Tech Stack & Tools

- **Python**  
- **Robot Framework**  
- **Selenium**  
- **SeleniumLibrary**
- **Page Object Model (POM)** design pattern  
-**Chrome WebDriver**  
- **Reports** – Test report folder (Log.html / Report.html)  
- **Git & GitHub** – Version control & code hosting  

---

##  Project Structure

```
Project_3/
│
├──Libraries
|  ├──ProductUtils.py
|
├── Resources                                          
│ ├──KeywordDefinationFiles
│   ├──Cart_keyword.robot
|   └──Checkout_keyword.robot
|   └──generic_keyword.robot
|   └──login_keyword.robot
|   └──menu_keyword.robot
|   └──Product_keyword.robot
|
├── TestData/                                            
│ └── Test_data.py
│
├── TestLocators
| └── locators.py
│
├── TestCodes                                             
│  ├──Add_to_cart_test.robot
|  └──Cart_validatio_test.robot
|  └──CartIcon_tests.robot
|  └──Checkout_test.robot
|  └──Invalidlogin_tests.robot
|  └──Login_test.robot
|  └──Logout_tests.robot
|  └──Random_selection_test.robot
|  └──Reset_state_tests.robot
|  └──Sort_tests.robot
├── 
├── log.html
├── output.xml
├──report.html
├──requirements.txt
└── README.md # Project documentation

```

##  Features / What this Framework Provides

- **Modular design using POM** — Page classes cleanly separate locators and page methods for maintainability.  
- **Keyword based structure** — Project follows reusable keyword based structure.  .  
- **Externalized test data** — Keep test data in separate file, keeps test logic separate from data.  
- **Reports** — After execution, Robot Framework generates    report.html,log.html,output.xml
- **Python** — Python is used for random product selection and reusable utility functionality.
 
---

## **Test Cases Covered**
```
1. Login with valid users
2. Login with Invalid login
3. Validate logout functionality
4. Cart Icon validation
5. Select four random product and display the details
6. Add selected product to the cart
7. Validate cart products
8. Complete checkout
9. Validate sorting of the products
10. Validate reset app state 
