*** Settings ***
Documentation     A test suite with a single test for valid login.
Resource          resource.robot

*** Test Cases ***
Valid login
    My account
    sleep    2
    My account Page Should Be Open
    Close window
