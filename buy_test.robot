*** Settings ***
Resource    resource.robot
Library    SeleniumLibrary

*** Test Cases ***
Proceed through checkout
    set selenium implicit wait    12s
    Open browser to main page
    go to blouses page
    scroll to element    ${SCROLL_HELP}
    mouse over    ${PRODUCT}
    click element    ${ADDBLOUSE}
    wait until element is visible  ${proceedtocheckout}
    click element    ${proceedtocheckout}
    sleep    8s
    scroll to element    ${proceedtocheckout}
    click element    ${proceedtocheckout}
    Input email
    Input password
    log in
    add comment     "witam państwa"
    find element
    close browser




