#!/usr/bin/env bash
cd $(dirname $0)
. ./_params.sh
killall $(basename $CLIENT)