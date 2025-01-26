#!/bin/bash

name=$1

# todo: proper validation would be good
if [[ "$name" == "" ]]; then
    echo "!!! name is missing";
    exit 1;
fi

rm -rf fp-$name
rm -rf fp-$name.yaml
