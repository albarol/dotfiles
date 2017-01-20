#!/usr/bin/fish

if [ (count $argv) -ne 2 ]
    echo "Usage: update_license_package <license_package> <package_sku>"
    exit 1
end

set transaction_id (uuidgen)

curl --verbose \
     --header "Content-Type: application/json" \
     --header "X-Transaction-Id: $transaction_id" \
     --header "Authorization: token $PARTNER_TOKEN" \
     --header "Accept: application/json; indent=4" \
     --data "{\"package_sku\": \"$argv[2]\"}" \
     --request GET "$PARTNER_URL/v1/license-packages/$argv[1]/"
