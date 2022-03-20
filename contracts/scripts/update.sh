#!/bin/bash

CONTRACT='secret18vd8fpwxzck93qlwghaj6arh4p7c5n8978vsyg'
UPDATE_MSG='{"update":{"motd":"#thesecretisout"}}'

secretd tx compute execute $CONTRACT $UPDATE_MSG --from a -y --keyring-backend test | jq
