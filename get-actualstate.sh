#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <FILE_PATH>"
    exit 1
fi

sha256sum "$1" | awk '{print $1}'
