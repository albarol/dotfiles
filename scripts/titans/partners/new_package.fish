#!/usr/bin/fish

if [ (count $argv) -ne 4 ]
    echo "Usage: new_package_credify <license_package> <package_sku> <cpfcnpj> <placa>"
    exit 1
end

set transaction_id (uuidgen)

curl --verbose \
     --header "Content-Type: application/json" \
     --header "X-Transaction-Id: $transaction_id" \
     --header "Authorization: token $PARTNER_TOKEN" \
     --header "Accept: application/json; indent=4" \
     --data "{\"callback\": \"http://alerta:alerta@webhook.titansgroup.net/alerta/provisioning/\", \"package_sku\": \"$argv[2]\", \"profile\": {\"buyer_code\": \"$argv[3]\", \"cpfcnpj\": \"$argv[3]\", \"car_id\": \"$argv[4]\"}}" \
     --request PUT "$PARTNER_URL/v1/license-packages/$argv[1]/"
