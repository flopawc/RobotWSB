--outputdir C:/Users/NBPFlorek/Desktop --timestampoutputs

*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${URL}    http://automationpractice.com/index.php
${BROWSER}    headlessfirefox
#${BROWSER}    Firefox
${VALID USER}    ywh50680@jiooq.com
${VALID PASSWORD}    zaq12wsx
${SIGN IN}    xpath: //*[@id="header"]/div[2]/div/div/nav/div[1]/a
${EMAIL FIELD}    id: email
${PASSWORD FIELD}    id: passwd
${LOG IN}    id: SubmitLogin
${TITLE}    My Account - My Store
${PICK}    xpath: /html/body/div/div[2]/div/div[2]/div/div[1]/ul[1]/li[7]/div/div[1]/div/a[1]/img
${ADDTC}    title: "Add to cart"
${WOMEN}      class: sf-with-ul
${BLOUSES}      xpath: //*[@id="block_top_menu"]/ul/li[1]/ul/li[1]/ul/li[2]/a
${SCROLL_HELP}    xpath: /html/body/div/div[2]/div/div[3]/div[1]/section/p/a
${PRODUCT}    class: product-container
${ADDBLOUSE}    xpath: //*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]
${PROCEEDtoCHECKOUT}    xpath: //*[contains(text(), "Proceed to checkout")]
${FORM}     class: form-control
*** Keywords ***
Open browser to main page
    open browser    ${URL}    ${BROWSER}
    maximize browser window

Open browser to login page
    open browser    ${URL}    ${BROWSER}
    maximize browser window
    click element    ${SIGN IN}

Input email
    input text    ${EMAIL FIELD}    ${VALID USER}

Input password
    input text    ${PASSWORD FIELD}    ${VALID PASSWORD}

Log in
    click element    ${LOG IN}

Close window
    close browser

My account Page Should Be Open
    Title Should Be    My account - My Store

My account
    open browser to login page
    Input email
    Input password
    Log in

go to blouses page
    mouse over    ${WOMEN}
    wait until element is visible    ${BLOUSES}
    click element    ${BLOUSES}

change color to white
    run keyword and ignore error    click element    id: color_8

add one
    sleep    2s
    click button     class: icon-plus

add to cart
    click button    id: add_to_cart

Add comment
    [Arguments]     ${msg}
    scroll element into view    ${form}
    input text    ${form}   {msg}

Scroll To Element
    [Arguments]  ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y})
