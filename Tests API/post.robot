*** Settings ***
Documentation       POST    /partners

Library             RequestsLibrary

*** Variables ***
${BASE_URL}         http://localhost:3333/partners

*** Test Cases ***
Conectar a API BugerEats
    Create Session    CreatePartner    ${BASE_URL}

Should create a new partner
    ${PayLoad}    Create Dictionary
    ...    name=Pizzas Papito4
    ...    email=contato4@papito.com.br
    ...    whatsapp=11999999999
    ...    business=Restaurante

    ${heaDers}    Create Dictionary
    ...    Content-Type=application/json
    ...    auth_user=qa
    ...    auth_password=ninja

    ${reponse}    POST On Session
    ...    CreatePartner
    ...    ${BASE_URL}
    ...    json=${payload}
    ...    headers=${headers}
    ...    expected_status=201
