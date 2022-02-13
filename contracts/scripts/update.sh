#!/bin/bash

CONTRACT=''
UPDATE_MSG='{"update":{"motd":"#thesecretisout"}}'

secretd tx compute execute $CONTRACT $UPDATE_MSG --from a -y --keyring-backend test | jq
