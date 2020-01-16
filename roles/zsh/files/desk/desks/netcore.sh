#!/usr/bin/env bash

# Dotnet utilities
#
# Description: Dotnet commands

# Run test suite
t() {
  dotnet test $@
}

# Keep watching and run tests
tw() {
  fswatch modify . dotnet test $@
}

# List all available tests
tl() {
  dotnet test -t $@
}
