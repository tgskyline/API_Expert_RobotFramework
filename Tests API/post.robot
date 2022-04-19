*** Settings ***
Documentation       POST    /partners

Library             RequestsLibrary
Library             RobotMongoDBLibrary.Delete


*** Variables ***
${BASE_URL}         http://localhost:3333/partners
&{MONGO_URI}        connection=mongodb+srv://bugereates:AFUB3uVt5exShGsp@cluster0.ivqe9.mongodb.net/PartnerDB?retryWrites=true&w=majority
...                 database=PartnerDB
...                 collection=partner


*** Test Cases ***
Conectar a API BugerEats
    Create Session    CreatePartner    ${BASE_URL}

Should delete a partner
    ${Filter}    Create Dictionary
    ...    name=Pizzas Papito
    Set Variable    ${Filter}

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

    &{FILLTER}    Create Dictionary    name=Tarathep    address=Thailand
    ${RESULTS}    Find    ${MONGODB_CONNECT_STRING}    ${FILLTER}
    FOR    ${RESULT}    IN    @{RESULTS}
       Log To Console    ${RESULT["phone"]}
    END
