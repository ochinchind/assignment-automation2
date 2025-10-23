*** Settings ***
Library  SeleniumLibrary
Variables   ./locators.py
Variables   ./testData.py
*** Keywords ***
Log in
    Open Browser    ${baseUrl}      Chrome
    wait until page contains element    ${logInButton}    timeout=80      error=logInButtonNotFound
    sleep   1s
    click element   ${logInButton}
    wait until page contains element     ${loginUsernameField}    timeout=80      error=logInButtonNotFound
    sleep   1s
    input text      ${loginUsernameField}      ${login}
    Input Password    ${loginPasswordField}      ${password}
    Sleep    1s
    Click Element    ${logInFormButton}
    Sleep    2s

Close Browser
    Close All Browsers

Sign Up
    Open Browser    ${baseUrl}      Chrome
    wait until page contains element    ${signUpButton}    timeout=80      error=logInButtonNotFound
    sleep   1s
    click element   ${signUpButton}
    wait until page contains element     ${signUpUsername}    timeout=80      error=logInButtonNotFound
    sleep   1s
    Input Text    ${signUpUsername}    ${login}
    Sleep    2s
    Input Password    ${signUpPassword}    ${password}
    Sleep    2s
    Click Element    ${signUpFormButton}
    Sleep    3s

Logout
    Wait Until Page Contains Element    ${logoutButton}    timeout=80    error=Logout button not found
    Sleep    1s
    Click Element    ${logoutButton}
    Sleep    2s
    Wait Until Page Contains Element    ${logInButton}    timeout=80    error=Login button should appear after logout

Add to Cart
    Wait Until Page Contains Element    ${productLink}    timeout=80    error=Product not found
    Sleep    1s
    Click Element    ${productLink}
    Sleep    2s
    Wait Until Page Contains Element    ${addToCartButton}    timeout=80    error=Add to cart button not found
    Sleep    1s
    Click Element    ${addToCartButton}
    Sleep    2s
    Handle Alert    accept
    Sleep    1s
