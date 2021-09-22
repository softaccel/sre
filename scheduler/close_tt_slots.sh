/bin/bash

curl --location --request POST 'http://localhost/dbapi/v2/spaleck/__call__/close_open_tt_slots' \
--header 'Content-Type: application/json' \
--data-raw '[{"name": "cnt","dir": "out"}]'