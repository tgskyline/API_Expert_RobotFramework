*** Settings ***
Documentation       POST    /partners

Resource            ../Resources/base.robot
Library             String

Suite Setup         Create partnert list


*** Test Cases ***
Should return a partner list
    ${Response}    GET Partners
    status should be    200

    ${size}    Get Length    ${response.json()}
    Should Be True    ${size} > 0

Should search parner by name
    ${Response}    Search Partners    Tabata
    status should be    200

    ${size}    Get Length    ${response.json()}
    Should Be True    ${size} == 1

    Should Be Equal    ${response.json()}[0][name]    Tabata Mercearia


*** Keywords ***
Create partnert list
    ${partners}    Factory Partner List

    FOR    ${p}    IN    @{partners}
        Remove Partner By Name    ${partners}\[name]
        POST Partner    ${p}
    END
