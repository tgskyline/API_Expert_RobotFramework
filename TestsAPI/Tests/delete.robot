*** Settings ***
Documentation       DELETE    /partners

Resource            ../Resources/base.robot
Library             String


*** Test Cases ***
Should Remove A Partner
    ${partner}    Factory Remove Partner
    ${partner_id}    Create A New Partner    ${partner}

    DELETE Partner    ${partner_id}
    Status Should Be    204

Should Return 404 On Remove Partner
    ${partner}    Factory Remove Partner
    ${partner_id}    Create A New Partner    ${partner}
    Remove Partner By Name    ${partner}[name]

    DELETE Partner    ${partner_id}
    Status Should Be    404
