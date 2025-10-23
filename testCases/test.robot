*** Settings ***
Resource  ../resources/resources.robot
Suite Teardown    Close Browser


*** Variables ***

*** Keywords ***

*** Test Cases ***
TC1_SIGN_UP_TEST
    Sign Up
    Close Browser

TC2_LOGIN_TEST
    Log in
    Close Browser

TC3_LOGOUT_TEST
    Log in
    Logout
    Close Browser

TC4_ADD_TO_CART_TEST
    Log in
    Add to Cart
    Close Browser
