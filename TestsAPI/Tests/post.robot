*** Settings ***
Documentation       POST        /partners

Resource            ../Resources/base.robot


*** Test Cases ***
Conectar a API BugerEats
        Create Session        CreatePartner        ${BASE_URL}

Should create a new partner
        ${Partner}        Factory New Partner
        Set Global Variable        ${Partner}

# Encapsulamento do teste

        Remove Partner By Name        Pizzas Papito

        ${response}        POST Partner        ${Partner}

        ${Result}        Find Partner By Name        Pizzas Papito
        Should Be Equal        ${Response.json()}[partner_id]        ${Result}[_id]
