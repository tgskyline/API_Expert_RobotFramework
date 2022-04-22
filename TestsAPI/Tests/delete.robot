*** Settings ***
Documentation       POST    /partners

Resource            ../Resources/base.robot
Library             String


*** Test Cases ***
Should remove a partner
    ${partner}    Factory remove partner
    ${partner_id}    Create a new partner    ${partner}

    DELETE Partner    ${partner_id}
    Status Should Be    204

Should return 404 on remove partner
    ${partner}    Factory remove partner
    ${partner_id}    Create a new partner    ${partner}

    Remove Partner By Name    ${partner}[name]

    DELETE Partner    ${partner_id}
    Status Should Be    404
