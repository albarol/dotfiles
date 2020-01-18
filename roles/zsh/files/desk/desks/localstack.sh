#!/usr/bin/env bash

# Aws Localstack
#
# Description: aws cli using localstack

alias lrun='docker run --rm --name localstack -p 4567-4599:4567-4599 -p 8099:8080 -v /var/run/docker.sock:/var/run/docker.sock localstack/localstack'
alias lstop='docker stop localstack'

#Starting local Elasticsearch (http port 4571)...

alias apigateway='aws --endpoint-url=http://localhost:4567 apigateway'
alias apigtw='apigateway'
alias cloudformation='aws --endpoint-url=http://localhost:4581 cloudformation'
alias cf='cloudformation'
alias cloudwatch='aws --endpoint-url=http://localhost:4582 cloudwatch'
alias dynamodb='aws --endpoint-url=http://localhost:4569 dynamodb'
alias ddb='dynamodb'
alias dynamodbstreams='aws --endpoint-url=http://localhost:4570 dynamodbstreams'
alias ddbs='dynamodbstreams'
alias ec2='aws --endpoint-url=http://localhost:4597 ec2'
alias es='aws --endpoint-url=http://localhost:4578 es'
alias events='aws --endpoint-url=http://localhost:4587 events' # cloudwatch events
alias firehose='aws --endpoint-url=http://localhost:4573 firehose'
alias iam='aws --endpoint-url=http://localhost:4593 iam'
alias kinesis='aws --endpoint-url=http://localhost:4568 kinesis'
alias kms='aws --endpoint-url=http://localhost:4599 kms'
alias lambda='aws --endpoint-url=http://localhost:4574 lambda'
alias logs='aws --endpoint-url=http://localhost:4586 logs' # cloudwatch logs
alias redshift='aws --endpoint-url=http://localhost:4577 redshift'
alias route53='aws --endpoint-url=http://localhost:4580 route53'
alias s3='aws --endpoint-url=http://localhost:4572 s3'
alias s3api='aws --endpoint-url=http://localhost:4572 s3api'
alias s3control='aws --endpoint-url=http://localhost:4572 s3control'
alias secretsmanager='aws --endpoint-url=http://localhost:4584 secretsmanager'
alias ses='aws --endpoint-url=http://localhost:4579 ses'
alias sns='aws --endpoint-url=http://localhost:4575 sns'
alias sqs='aws --endpoint-url=http://localhost:4576 sqs'
alias ssm='aws --endpoint-url=http://localhost:4583 ssm'
alias sts='aws --endpoint-url=http://localhost:4592 sts'
alias stepfunctions='aws --endpoint-url=http://localhost:4585 stepfunctions'
