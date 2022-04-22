*** Settings ***
Documentation       RabbitMQ Helpers API

Library             RequestsLibrary


*** Variables ***
${RABBIT_URL}           https://sparrow.rmq.cloudamqp.com/api/queues/obsqplap/email
&{RABBIT_HEADERS}       Content-Type=application/json
...                     Authorization=Basic b2JzcXBsYXA6djU1MDRPWF9RSmstUDFIM3VZcWVNVldUT3gydm1pbTc=


*** Keywords ***
Purge Messages
    ${payload}    Create Dictionary    vhost=obsqplap    name=email    mode=purge

    Create Session    Purge    ${RABBIT_URL}/contents

    ${response}    DELETE On Session
    ...    Purge
    ...    ${RABBIT_URL}/contents
    ...    json=${payload}
    ...    headers=${RABBIT_HEADERS}
    ...    expected_status=204

    [Return]    ${response}

Get Message
    ${payload}    Create Dictionary
    ...    vhost=obsqplap
    ...    name=email
    ...    truncate=50000
    ...    ackmode=ack_requeue_true
    ...    encoding=auto
    ...    count=1

    Create Session    Get    ${RABBIT_URL}/get

    ${response}    POST On Session
    ...    Get
    ...    ${RABBIT_URL}/get
    ...    json=${payload}
    ...    headers=${RABBIT_HEADERS}
    ...    expected_status=200

    [Return]    ${response.json()}[0]
