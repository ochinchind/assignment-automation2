*** Settings ***
Resource  ../resources/resources.robot
Suite Teardown    Close Browser

*** Variables ***
# Browser configurations
@{CHROME_CONFIG}    Chrome    Windows    10    120.0
@{SAFARI_CONFIG}    Safari    OS X    Monterey    15.6
@{EDGE_CONFIG}      Edge      Windows    10    latest

*** Test Cases ***
TC1_SIGN_UP_CHROME
    [Tags]    chrome
    Sign Up    @{CHROME_CONFIG}
    Close Browser

TC1_SIGN_UP_SAFARI
    [Tags]    safari
    Sign Up    @{SAFARI_CONFIG}
    Close Browser

TC1_SIGN_UP_EDGE
    [Tags]    edge
    Sign Up    @{EDGE_CONFIG}
    Close Browser

TC2_LOGIN_CHROME
    [Tags]    chrome
    Log in    @{CHROME_CONFIG}
    Close Browser

TC2_LOGIN_SAFARI
    [Tags]    safari
    Log in    @{SAFARI_CONFIG}
    Close Browser

TC2_LOGIN_EDGE
    [Tags]    edge
    Log in    @{EDGE_CONFIG}
    Close Browser

TC3_LOGOUT_CHROME
    [Tags]    chrome
    Log in    @{CHROME_CONFIG}
    Logout
    Close Browser

TC3_LOGOUT_SAFARI
    [Tags]    safari
    Log in    @{SAFARI_CONFIG}
    Logout
    Close Browser

TC3_LOGOUT_EDGE
    [Tags]    edge
    Log in    @{EDGE_CONFIG}
    Logout
    Close Browser

TC4_ADD_TO_CART_CHROME
    [Tags]    chrome
    Log in    @{CHROME_CONFIG}
    Add to Cart
    Close Browser

TC4_ADD_TO_CART_SAFARI
    [Tags]    safari
    Log in    @{SAFARI_CONFIG}
    Add to Cart
    Close Browser

TC4_ADD_TO_CART_EDGE
    [Tags]    edge
    Log in    @{EDGE_CONFIG}
    Add to Cart
    Close Browser