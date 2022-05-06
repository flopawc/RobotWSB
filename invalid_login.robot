*** Settings ***
Documentation     A test suite containing tests related to invalid login.
Suite Setup       Open browser to login page
Suite Teardown    Close Browser
Resource          resource.robot


*** Test Cases ***

Tests with invalid username
    [Template]    Invalid login
    Invalid Username    invalid    ${VALID PASSWORD}    Invalid email address.
Tests with invalid password
    [Template]    Invalid login
    Invalid Password    ${VALID USER}    invalid    Authentication failed.
Tests with invalid Username and password
    [Template]    Invalid login
    Invalid Username And Password    invalid    whatever    nvalid email address.
Tests with empty username
    [Template]    Invalid login
    Empty Username    ${EMPTY}    ${VALID PASSWORD}    An email address required.
Tests with empty password
    [Template]    Invalid login
    Empty Password    ${VALID USER}    ${EMPTY}    Password is required.
Tests with empty username and password
    [Template]    Invalid login
    Empty Username And Password    ${EMPTY}    ${EMPTY}    An email address required.

*** Keywords ***
Invalid login
   [Arguments]    ${0}    ${1}    ${2}    ${3}
   input text    ${EMAIL FIELD}    ${1}
   input text    ${PASSWORD FIELD}    ${2}
   click element    ${LOG IN}
   page should contain    ${3}