#!/bin/bash

CONTRACT='secret18vd8fpwxzck93qlwghaj6arh4p7c5n8978vsyg'
QUERY_MSG='{"get_motd":{}}'

secretd query compute query $CONTRACT $QUERY_MSG | jq
