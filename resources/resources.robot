*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Variables   ./locators.py
Variables   ./testData.py
*** Variables ***
${BROWSER}    Chrome
${BROWSERSTACK}    False


*** Keywords ***
Open Test Browser
    # Prefer environment variables so CI/script exports take effect
    ${ENV_BS}=    Get Environment Variable    BROWSERSTACK    default=${BROWSERSTACK}
    ${ENV_BROWSER}=    Get Environment Variable    BROWSER    default=${BROWSER}
    Run Keyword If    '${ENV_BS}'=='True'    Set BrowserStack Remote And Open    ${ENV_BROWSER}
    ...    ELSE    Open Browser    ${baseUrl}    ${ENV_BROWSER}

Set BrowserStack Remote And Open
    [Arguments]    ${browser}
    ${BS_USER}=    Get Environment Variable    BROWSERSTACK_USERNAME
    ${BS_KEY}=     Get Environment Variable    BROWSERSTACK_ACCESS_KEY
    # Validate credentials using non-deprecated keyword
    Should Not Be Empty    ${BS_USER}    BrowserStack username not set in environment variable BROWSERSTACK_USERNAME
    Should Not Be Empty    ${BS_KEY}     BrowserStack access key not set in environment variable BROWSERSTACK_ACCESS_KEY
    ${REMOTE_URL}=    Set Variable    https://${BS_USER}:${BS_KEY}@hub-cloud.browserstack.com/wd/hub
    Open Browser    ${baseUrl}    ${browser}    remote_url=${REMOTE_URL}
Log in
    Open Test Browser
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
    Open Test Browser
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
