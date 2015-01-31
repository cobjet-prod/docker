#!/bin/bash -e

main() {
    docker build --tag="cobjet/nodejs" .
}

main "$@"
