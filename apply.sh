#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <URL> <SHA256_HASH> <FILE_PATH>"
    exit 1
fi

wget -O /tmp/metal-agent "$1"

ACTUAL_HASH=$(sha256sum /tmp/metal-agent | awk '{print $1}')

if [ "$ACTUAL_HASH" == "$2" ]; then
    echo "Success!"
    cp /tmp/metal-agent "$3"
else
    echo "Error: Hash mismatch!"
    echo "Expected: $2"
    echo "Actual:   $ACTUAL_HASH"
    exit 1
fi
