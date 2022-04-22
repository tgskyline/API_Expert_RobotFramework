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

    [Return]    ${Response}

GET Partners
    Create Session    CreatePartner    ${BASE_URL}
    ${Response}    GET On Session
    ...    CreatePartner
    ...    ${BASE_URL}
    ...    headers=${HEADERS}
    ...    expected_status=any

    [Return]    ${Response}
