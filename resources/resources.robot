*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem
Library  Collections
Variables   ./locators.py
Variables   ./testData.py

*** Variables ***
${BROWSER}    Chrome
${BROWSERSTACK}    False

*** Keywords ***
Open Test Browser
    [Arguments]    ${browser}=Chrome    ${os}=Windows    ${os_version}=10    ${browser_version}=latest
    ${ENV_BS}=    Get Environment Variable    BROWSERSTACK    default=${BROWSERSTACK}
    Run Keyword If    '${ENV_BS}'=='True'    Open BrowserStack Browser    ${browser}    ${os}    ${os_version}    ${browser_version}
    ...    ELSE    Open Browser    ${baseUrl}    ${browser}

Open BrowserStack Browser
    [Arguments]    ${browser}    ${os}    ${os_version}    ${browser_version}
    ${BS_USER}=    Get Environment Variable    BROWSERSTACK_USERNAME
    ${BS_KEY}=     Get Environment Variable    BROWSERSTACK_ACCESS_KEY
    Should Not Be Empty    ${BS_USER}    BrowserStack username not set
    Should Not Be Empty    ${BS_KEY}     BrowserStack access key not set
    
    ${REMOTE_URL}=    Set Variable    https://${BS_USER}:${BS_KEY}@hub-cloud.browserstack.com/wd/hub
    
    # Create browser options based on browser type
    Run Keyword If    '${browser}'=='Chrome'    Open BrowserStack Chrome    ${REMOTE_URL}    ${os}    ${os_version}    ${browser_version}
    ...    ELSE IF    '${browser}'=='Safari'    Open BrowserStack Safari    ${REMOTE_URL}    ${os}    ${os_version}    ${browser_version}
    ...    ELSE IF    '${browser}'=='Edge'    Open BrowserStack Edge    ${REMOTE_URL}    ${os}    ${os_version}    ${browser_version}
    ...    ELSE    Fail    Unsupported browser: ${browser}

Open BrowserStack Chrome
    [Arguments]    ${remote_url}    ${os}    ${os_version}    ${browser_version}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    
    # BrowserStack specific options
    &{bstack_options}=    Create Dictionary
    ...    os=${os}
    ...    osVersion=${os_version}
    ...    browserVersion=${browser_version}
    ...    buildName=browserstack-build-1
    ...    projectName=BrowserStack Sample
    ...    sessionName=Robot Framework Test
    ...    seleniumVersion=4.0.0
    
    Call Method    ${chrome_options}    set_capability    bstack:options    ${bstack_options}
    
    Open Browser    ${baseUrl}    Chrome    remote_url=${remote_url}    options=${chrome_options}

Open BrowserStack Safari
    [Arguments]    ${remote_url}    ${os}    ${os_version}    ${browser_version}
    ${safari_options}=    Evaluate    sys.modules['selenium.webdriver'].SafariOptions()    sys, selenium.webdriver
    
    # BrowserStack specific options
    &{bstack_options}=    Create Dictionary
    ...    os=${os}
    ...    osVersion=${os_version}
    ...    browserVersion=${browser_version}
    ...    buildName=browserstack-build-1
    ...    projectName=BrowserStack Sample
    ...    sessionName=Robot Framework Test
    ...    seleniumVersion=4.0.0
    
    Call Method    ${safari_options}    set_capability    bstack:options    ${bstack_options}
    
    Open Browser    ${baseUrl}    Safari    remote_url=${remote_url}    options=${safari_options}

Open BrowserStack Edge
    [Arguments]    ${remote_url}    ${os}    ${os_version}    ${browser_version}
    ${edge_options}=    Evaluate    sys.modules['selenium.webdriver'].EdgeOptions()    sys, selenium.webdriver
    
    # BrowserStack specific options
    &{bstack_options}=    Create Dictionary
    ...    os=${os}
    ...    osVersion=${os_version}
    ...    browserVersion=${browser_version}
    ...    buildName=browserstack-build-1
    ...    projectName=BrowserStack Sample
    ...    sessionName=Robot Framework Test
    ...    seleniumVersion=4.0.0
    
    Call Method    ${edge_options}    set_capability    bstack:options    ${bstack_options}
    
    Open Browser    ${baseUrl}    Edge    remote_url=${remote_url}    options=${edge_options}

Log in
    [Arguments]    ${browser}=Chrome    ${os}=Windows    ${os_version}=10    ${browser_version}=latest
    Open Test Browser    ${browser}    ${os}    ${os_version}    ${browser_version}
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
    [Arguments]    ${browser}=Chrome    ${os}=Windows    ${os_version}=10    ${browser_version}=latest
    Open Test Browser    ${browser}    ${os}    ${os_version}    ${browser_version}
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