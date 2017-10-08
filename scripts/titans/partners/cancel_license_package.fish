#!/usr/bin/fish

if [ (count $argv) -ne 1 ]
    echo "Usage: cancel_license_package.fish <license_package>"
    exit 1
end

set transaction_id (uuidgen)

curl --verbose \
     --header "Content-Type: application/json" \
     --header "X-Transaction-Id: $transaction_id" \
     --header "Authorization: token $PARTNER_TOKEN" \
     --header "Accept: application/json; indent=4" \
     --data "{\"state\": \"CANCELLED\"}" \
     --request PATCH "$PARTNER_URL/v1/license-packages/$argv[1]/"