*** Settings ***
Resource    resource.robot
Library    SeleniumLibrary

*** Test Cases ***
Proceed through checkout
    set selenium implicit wait    12s
    Open browser to main page
    go to blouses page
    scroll to element    ${PRODUCT}
    mouse over    ${PRODUCT}
    click element    ${ADDBLOUSE}
    Sleep    5s
    click element    ${proceedtocheckout}
    Sleep    5s
    title should be    Order - My Store
    scroll to element    ${proceedtocheckout2}
    click element    ${proceedtocheckout2}
    Log in
    go through checkout
    run keyword and ignore error    page should contain    Check payment
    click element    ${confirmorder}
    page should contain    Your order on My Store is complete.
    close browser




