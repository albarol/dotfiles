#!/usr/bin/env bash

# Configure environment to work with go
#
# Description: Node environment

export GOROOT="/usr/local/go"
if [[ -s "${GOROOT}" ]]; then
  export PATH=$PATH:$GOROOT/bin

  export GOPATH=$HOME/go
  export GOBIN=$GOPATH/bin
  export PATH=$PATH:$GOBIN
fi
