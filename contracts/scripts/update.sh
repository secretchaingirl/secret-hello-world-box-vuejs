#!/bin/bash

UPDATE_MSG='{"update":{"motd":"Hello_Crypto!"}}'
CONTRACT=''
secretd tx compute execute $CONTRACT $UPDATE_MSG --from a -y --keyring-backend test | jq
