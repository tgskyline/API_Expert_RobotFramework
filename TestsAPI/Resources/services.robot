*** Settings ***
Documentation       Camada de serviços

Library             RequestsLibrary


*** Variables ***
${BASE_URL}     http://localhost:3333/partners
&{HEADERS}      Content-Type=application/json    auth_user=qa    auth_password=ninja


*** Keywords ***
POST Partner
    [Arguments]    ${Payload}
    Create Session    CreatePartner    ${BASE_URL}
    ${Response}    POST On Session
    ...    CreatePartner
    ...    ${BASE_URL}
    ...    json=${payload}
    ...    headers=${HEADERS}
    ...    expected_status=any

    Set Global Variable    ${payload}
    [Return]    ${Response}

GET Partners
    Create Session    CreatePartner    ${BASE_URL}
    ${Response}    GET On Session
    ...    CreatePartner
    ...    ${BASE_URL}
    ...    headers=${HEADERS}
    ...    expected_status=any

    [Return]    ${Response}

Search Partners
    [Arguments]    ${name}

    ${Query}    Create Dictionary    name=${name}

    Create Session    CreatePartner    ${BASE_URL}
    ${Response}    GET On Session
    ...    CreatePartner
    ...    ${BASE_URL}
    ...    params=${Query}
    ...    headers=${HEADERS}
    ...    expected_status=any

    [Return]    ${Response}

Enable Partner
    [Arguments]    ${partner_id}

    Create Session    CreatePartner    ${BASE_URL}/${partner_id}/enable
    ${Response}    PUT On Session
    ...    CreatePartner
    ...    ${BASE_URL}/${partner_id}/enable
    ...    json=${payload}
    ...    headers=${HEADERS}
    ...    expected_status=any

    [Return]    ${Response}
