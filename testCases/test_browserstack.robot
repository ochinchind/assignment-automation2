*** Settings ***
Resource  ../resources/resources.robot
Suite Teardown    Close Browser
Test Teardown    Mark Test Complete

*** Variables ***
# Browser configurations
@{CHROME_CONFIG}    Chrome    Windows    10    120.0
@{SAFARI_CONFIG}    Safari    OS X    Monterey    15.6
@{EDGE_CONFIG}      Edge      Windows    10    latest

*** Keywords ***
Mark Test Complete
    ${test_status}=    Set Variable If    '${TEST_STATUS}' == 'PASS'    passed    failed
    ${test_message}=    Set Variable If    '${TEST_STATUS}' == 'PASS'    ${TEST_NAME} completed successfully    ${TEST_NAME} failed: ${TEST_MESSAGE}
    Mark Test Status    ${test_status}    ${test_message}
    Close Browser

*** Test Cases ***
TC1_SIGN_UP_CHROME
    [Tags]    chrome
    Sign Up    @{CHROME_CONFIG}

TC1_SIGN_UP_SAFARI
    [Tags]    safari
    Sign Up    @{SAFARI_CONFIG}

TC1_SIGN_UP_EDGE
    [Tags]    edge
    Sign Up    @{EDGE_CONFIG}

TC2_LOGIN_CHROME
    [Tags]    chrome
    Log in    @{CHROME_CONFIG}

TC2_LOGIN_SAFARI
    [Tags]    safari
    Log in    @{SAFARI_CONFIG}

TC2_LOGIN_EDGE
    [Tags]    edge
    Log in    @{EDGE_CONFIG}

TC3_LOGOUT_CHROME
    [Tags]    chrome
    Log in    @{CHROME_CONFIG}
    Logout

TC3_LOGOUT_SAFARI
    [Tags]    safari
    Log in    @{SAFARI_CONFIG}
    Logout

TC3_LOGOUT_EDGE
    [Tags]    edge
    Log in    @{EDGE_CONFIG}
    Logout

TC4_ADD_TO_CART_CHROME
    [Tags]    chrome
    Log in    @{CHROME_CONFIG}
    Add to Cart

TC4_ADD_TO_CART_SAFARI
    [Tags]    safari
    Log in    @{SAFARI_CONFIG}
    Add to Cart

TC4_ADD_TO_CART_EDGE
    [Tags]    edge
    Log in    @{EDGE_CONFIG}
    Add to Cart