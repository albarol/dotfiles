#!/usr/bin/fish

set transaction_id (uuidgen)

curl --verbose \
     --header "Content-Type: application/json" \
     --header "X-Transaction-Id: $transaction_id" \
     --header "Authorization: token $PARTNER_TOKEN" \
     --header "Accept: application/json; indent=4" \
     --request GET "$PARTNER_URL/health"
