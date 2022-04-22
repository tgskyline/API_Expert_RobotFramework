*** Settings ***
Documentation       POST    /partners

Resource            ../Resources/base.robot


*** Test Cases ***
Should create a new partner
    [Tags]    happy_way
    ${Partner}    Factory New Partner
    Remove Partner By Name    ${Partner}[name]
    ${response}    POST Partner    ${Partner}
    Status Should Be    201
    ${Result}    Find Partner By Name    ${Partner}[name]
    Should Be Equal    ${Response.json()}[partner_id]    ${Result}[_id]

Should return duplicate company name
    [Tags]    sad_way
    ${Partner}    Factory Dup Name
    ${partner_id}    Create a new partner    ${partner}
    ${Response}    POST Partner    ${Partner}
    Status Should Be    409
    Should Be Equal    ${Response.json()}[message]    Duplicate company name
