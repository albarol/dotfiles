#!/usr/bin/env bash

# Devops tools
#
# Description: Devops tools

KUBE_CONFIG=$HOME/.kube/config

# Change kubernetes context
kcontext() {
  CTX_NAME=$(cat $KUBE_CONFIG | yq -r '.contexts[].name' | fzf)
  CTX_LINE=$(grep -n "current-context" $KUBE_CONFIG | awk -F ':' '{print $1}')

  sed -i "${CTX_LINE}s/.*/current-context: ${CTX_NAME}/" $KUBE_CONFIG
}
