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
${BROWSER}    Chrome
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
${SCROLL_HELP}    xpath: //*[@id="informations_block_left_1"]/div/ul/li[1]/a
${PRODUCT}    class: class: product-container
${ADDBLOUSE}    xpath: //*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]
${PROCEEDtoCHECKOUT}    xpath: //*[@id="layer_cart"]/div[1]/div[2]/div[4]/a
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
    scroll element into view    //*[@id="center_column"]/p[2]/a[1]
    click button     xpath: //*[@id="cart_quantity_up_2_7_0_0"]

add to cart
    click button    id: add_to_cart