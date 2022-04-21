*** Settings ***
Documentation       Database helpers connection

Library             RobotMongoDBLibrary.Delete
Library             RobotMongoDBLibrary.Find


*** Variables ***
&{MONGO_URI}    connection=mongodb+srv://bugereates:AFUB3uVt5exShGsp@cluster0.ivqe9.mongodb.net/PartnerDB?retryWrites=true&w=majority
...             database=PartnerDB
...             collection=partner


*** Keywords ***
Remove Partner By Name
    [Arguments]    ${Partner_name}
    ${Filter}    Create Dictionary
    ...    name=${Partner_name}

    DeleteOne    ${MONGO_URI}    ${Filter}

    Set Global Variable    ${Filter}

Find Partner By Name
    [Arguments]    ${Partner_name}

    ${Result}    Find    ${MONGO_URI}    ${Filter}

    Set Global Variable    ${Result}
    [Return]    ${Result}[0]
