*** Settings ***
Documentation       POST    /partners

Resource            ../Resources/base.robot

Library    String

*** Test Cases ***
Should return a partner list

    ${partners}    Factory Partner List
    
    FOR    ${p}     IN      @{partners}
        Remove Partner By Name    ${partners}\[name] 
        POST Partner    ${p}
    END
    ${Response}    GET Partners
    status should be    200

    ${size}    Get Length    ${response.json()}
    Should Be True    ${size} > 0
