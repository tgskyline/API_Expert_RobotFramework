*** Settings ***
Documentation       Camada de serviços

Library             RequestsLibrary


*** Variables ***
${BASE_URL}     http://localhost:3333/partners
&{HEADERS}      Content-Type=application/json        auth_user=qa        auth_password=ninja


*** Keywords ***
POST Partner
        [Arguments]        ${Payload}

        ${Response}        POST On Session
        ...        CreatePartner
        ...        ${BASE_URL}
        ...        json=${payload}
        ...        headers=${HEADERS}
        ...        expected_status=201

        [Return]        ${Response}
