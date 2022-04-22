*** Settings ***
Documentation       Helpers

Resource            ../Resources/base.robot


*** Keywords ***
Create a new partner
    [Arguments]    ${partner}

    Remove Partner By Name    ${partner}[name]
    ${response}    POST Partner    ${partner}
    ${partner_id}    Set Variable    ${response.json()}[partner_id]

    [Return]    ${partner_id}
