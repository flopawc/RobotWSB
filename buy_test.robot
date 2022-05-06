*** Settings ***
Resource    resource.robot
Library    SeleniumLibrary\\


*** Test Cases ***
Proceed through checkout
    Open browser to main page
    go to blouses page
    scroll element into view    ${SCROLL_HELP}
    mouse over    ${PRODUCT}
    click element    ${ADDBLOUSE}
    sleep    3s
    wait until element is visible   ${PROCEEDtoCHECKOUT}
    sleep    3s
    add one
    change color to white
    add to cart
    click element    class: btn btn-default button button-medium
    Input email
    Input password

    close window




