*** Settings ***
Library     SeleniumLibrary

Resource    ../Resources/KeywordDefinitionFiles/generic_keyword.robot
Resource    ../Resources/KeywordDefinitionFiles/login_keyword.robot

Variables   ../Resources/TestData/Test_data.py

Test Setup  Open SauceDemo url
Test Teardown   Close SauceDemo

*** Test Cases ***

Login with standard_user
    Login To SauceDemo    standard_user    ${PASSWORD}
    Verify Login success

Login with problem_user
    Login To SauceDemo    problem_user    ${PASSWORD}
    Verify Login success

Login with performance_glitch_user
    Login To SauceDemo    performance_glitch_user    ${PASSWORD}
    Verify Login success

Login with error_user
    Login To SauceDemo    error_user    ${PASSWORD}
    Verify Login success

Login with visual_user
    Login To SauceDemo   visual_user    ${PASSWORD}
    Verify Login success

Login with locked_out_user
     Login To SauceDemo    locked_out_user    ${PASSWORD}
     Verify Login Error    Epic sadface: Sorry, this user has been locked out
