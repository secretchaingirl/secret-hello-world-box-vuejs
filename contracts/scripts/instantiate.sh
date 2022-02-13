#!/bin/bash

INIT='{}'
CODE_ID=1
secretd tx compute instantiate $CODE_ID "$INIT" --from a --label "MOTD" -y --keyring-backend test | jq
