#!/usr/bin/env bash
cd $(dirname $0)
bash stop.sh &> /dev/null
rm -fr node*.datadir &> /dev/null
rm *.log &> /dev/null