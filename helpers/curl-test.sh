#!/bin/bash 

curl -L \
    -H "Accept: application/json" \
    -H "Connection: close" \
    -H "Content-type: application/json" \
    -X POST -d '{"input": "write a random 100 word paragraph"}' \
    http://127.0.0.1:8000/stream --no-buffer \
    --verbose 

