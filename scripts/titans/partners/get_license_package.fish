#!/usr/bin/fish

if [ (count $argv) -ne 1 ]
    echo "Usage: get_license_package.fish <license_package>"
    exit 1
end

set transaction_id (uuidgen)

curl --verbose \
     --header "Content-Type: application/json" \
     --header "X-Transaction-Id: $transaction_id" \
     --header "Authorization: token $PARTNER_TOKEN" \
     --header "Accept: application/json; indent=4" \
     --request GET "$PARTNER_URL/v1/license-packages/$argv[1]/"
