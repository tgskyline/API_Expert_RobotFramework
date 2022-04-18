*** Settings ***
Documentation       POST    /partners

Library             RequestsLibrary


*** Variables ***
${BASE_URL}         http=//localhost=3000/partner


*** Test Cases ***
Should create a new partner
    ${PayLoad}    Create Dictionary
    ...    name= Pizzas Papito3
    ...    email= contato3@papito.com.br
    ...    whatsapp= 11999999999
    ...    business= Restaurante

    ${heaDers}    Create Dictionary
    ...    Content-Type= application/json,
    ...    auth_user= qa,
    ...    auth_password= ninja

    ${reponse}    POST On Session
    ...    alias=Create new partner
    ...    url=${BASE_URL}
    ...    json=${payload}
    ...    headers=${headers}
    ...    expected_status=200
