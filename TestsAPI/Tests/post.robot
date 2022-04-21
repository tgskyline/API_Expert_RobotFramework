*** Settings ***
Documentation       POST    /partners

Resource            ${EXECDIR}/TestsAPI/Resources/base.robot


*** Test Cases ***
Conectar a API BugerEats
    Create Session    CreatePartner    ${BASE_URL}

Should delete a partner
    ${Filter}    Create Dictionary
    ...    name=Pizzas Papito
    Set suite Variable    ${Filter}

    DeleteOne    ${MONGO_URI}    ${Filter}

Should create a new partner
    ${PayLoad}    Create Dictionary
    ...    name=Pizzas Papito
    ...    email=contato@papito.com.br
    ...    whatsapp=11999999999
    ...    business=Restaurante

    ${Headers}    Create Dictionary
    ...    Content-Type=application/json
    ...    auth_user=qa
    ...    auth_password=ninja

    ${Reponse}    POST On Session
    ...    CreatePartner
    ...    ${BASE_URL}
    ...    json=${payload}
    ...    headers=${headers}
    ...    expected_status=201

    Log To Console    ${Reponse.json()}[partner_id]

    ${results}    Find    ${MONGO_URI}    ${Filter}

    Log To Console    ${results}[0][_id]

    Should Be Equal    ${Reponse.json()}[partner_id]    ${results}[0][_id]
