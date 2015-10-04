#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

show_help() {
printf "Usage: ./jupiter.sh [-ed]

    Keys Helper
    -e              Encrypts the keys directory
    -d              Decrypt the keys directory
    "
}

encrypt() {
    tar -czf jupiter.tar.gz keys
    gpg --encrypt -o jupiter.gpg -r D7C9202F jupiter.tar.gz
    rm jupiter.tar.gz
}

decrypt() {
    gpg --output jupiter.tar.gz --decrypt jupiter.gpg
    tar -xzf jupiter.tar.gz
    rm jupiter.tar.gz
}

OPTIND=1
while getopts "hed" opt; do
    case "$opt" in
        h)
            show_help
            exit 0
            ;;
        e)
            encrypt
            exit 1
            ;;
        d)
            decrypt
            exit 1
            ;;
    esac
done



# EOF
