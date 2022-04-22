*** Settings ***
Documentation       POST    /partners

Resource            ../Resources/base.robot
Library             String


*** Test Cases ***
Should enable a partner
    ${partner}    Factory Enable Partner

    ${partner_id}    Create a new partner    ${partner}

    ${response}    Enable Partner    ${partner_id}
    Status Should Be    200

Should return 404 on enable a partner
    ${partner}    Factory 404 Partner

    ${partner_id}    Create a new partner    ${partner}

    Remove Partner By Name    ${partner}[name]

    ${response}    Enable Partner    ${partner_id}
    Status Should Be    404
