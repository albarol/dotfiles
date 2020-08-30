#!/usr/bin/env bash

# Aws Localstack
#
# Description: aws cli using localstack

# Run docker localstack container
alias lrun='docker run --rm --name localstack -e LAMBDA_EXECUTOR=docker-reuse -p 4566:4566 -p 8099:8080 -v /var/run/docker.sock:/var/run/docker.sock localstack/localstack'

# Stop docker localstack container
alias lstop='docker stop localstack'

#Starting local Elasticsearch (http port 4566)...

alias apigateway='aws --endpoint-url=http://localhost:4566 apigateway'
alias apigtw='apigateway'
alias cloudformation='aws --endpoint-url=http://localhost:4566 cloudformation'
alias cf='cloudformation'
alias cloudwatch='aws --endpoint-url=http://localhost:4566 cloudwatch'
alias dynamodb='aws --endpoint-url=http://localhost:4566 dynamodb'
alias ddb='dynamodb'
alias dynamodbstreams='aws --endpoint-url=http://localhost:4566 dynamodbstreams'
alias ddbs='dynamodbstreams'
alias ec2='aws --endpoint-url=http://localhost:4566 ec2'
alias es='aws --endpoint-url=http://localhost:4566 es'
alias events='aws --endpoint-url=http://localhost:4566 events' # cloudwatch events
alias firehose='aws --endpoint-url=http://localhost:4566 firehose'
alias iam='aws --endpoint-url=http://localhost:4566 iam'
alias kinesis='aws --endpoint-url=http://localhost:4566 kinesis'
alias kms='aws --endpoint-url=http://localhost:4566 kms'
alias lambda='aws --endpoint-url=http://localhost:4566 lambda'
alias logs='aws --endpoint-url=http://localhost:4566 logs' # cloudwatch logs
alias redshift='aws --endpoint-url=http://localhost:4566 redshift'
alias route53='aws --endpoint-url=http://localhost:4566 route53'
alias s3='aws --endpoint-url=http://localhost:4566 s3'
alias s3api='aws --endpoint-url=http://localhost:4566 s3api'
alias s3control='aws --endpoint-url=http://localhost:4566 s3control'
alias secretsmanager='aws --endpoint-url=http://localhost:4566 secretsmanager'
alias ses='aws --endpoint-url=http://localhost:4566 ses'
alias sns='aws --endpoint-url=http://localhost:4566 sns'
alias sqs='aws --endpoint-url=http://localhost:4566 sqs'
alias ssm='aws --endpoint-url=http://localhost:4566 ssm'
alias sts='aws --endpoint-url=http://localhost:4566 sts'
alias stepfunctions='aws --endpoint-url=http://localhost:4566 stepfunctions'


# Show all info about api
api_describe() {
  local API_INFO=$(apigtw get-rest-apis | jq -r '.items[0]')
  printf "API: $(echo $API_INFO | jq -r '.name')\n====================\n"
  apigtw get-resources --rest-api-id $(echo $API_INFO | jq -r '.id')
}

# Show route to access apigateway
api_route() {
  local ID=$(apigtw get-rest-apis | jq -r '.items[0].id')
  local STAGE=$(apigtw get-stages --rest-api-id $ID | jq -r '.item[0].stageName')
  printf "http://localhost:4566/restapis/$ID/$STAGE/_user_request_"
}
