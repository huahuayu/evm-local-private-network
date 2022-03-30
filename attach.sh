#!/usr/bin/env bash
cd $(dirname $0)
. ./_params.sh
$CLIENT attach http://127.0.0.1:$(( ${RPCP_BASE} + 0 ))
