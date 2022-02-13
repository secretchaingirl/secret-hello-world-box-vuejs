#!/bin/bash

secretd tx compute store contract.wasm.gz --from a --gas 1000000 -y --keyring-backend test | jq
