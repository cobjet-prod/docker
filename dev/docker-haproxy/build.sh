#!/bin/bash -e

main() {
    docker build --tag="cobjet/haproxy" .
}

main "$@"
