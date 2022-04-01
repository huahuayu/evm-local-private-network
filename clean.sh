#!/usr/bin/env bash
cd $(dirname $0)
bash stop.sh &> /dev/null
rm -rf db &> /dev/null
rm *.log &> /dev/null
rm -rf ~/.avalanchego