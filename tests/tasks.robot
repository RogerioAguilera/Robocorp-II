*** Settings ***
Documentation       Template robot main suite.

Library    RPA.Browser.Selenium
Library    RPA.FileSystem
Library    RPA.Excel.Files
Library    RPA.Tables
Library    RPA.HTTP

*** Variables ***
${url}=             https://robotsparebinindustries.com/#/robot-order
${disable_alert}=     //button[contains(text(),'OK')]
@{orders}=       Head           Body          Legs         Address
${select_head}=     //*[@id="head"]


*** Keywords ***
Open Robot Industries
   Open Chrome Browser         ${url}
   Click Element          ${disable_alert}    
   Maximize Browser Window

Read the Excel File
     ${orders}=           Read table from CSV       ${CURDIR}/orders.csv       header=True
     FOR  ${robot}  IN  @{orders}
         Log    ${robot}
     
     END

Input form
    Select From List By Index     ${select_head}    1


*** Tasks ***
Acess form Robot
    Open Robot Industries
    Read the Excel File
    Input form
    
    