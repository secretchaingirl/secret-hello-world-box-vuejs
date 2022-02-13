#!/bin/bash

CONTRACT=''
QUERY_MSG='{"get_motd":{}}'

secretd query compute query $CONTRACT $QUERY_MSG | jq
