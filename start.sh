#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

cd `dirname $0`
if [[ ! -e avalanchego ]]
then
    git clone https://github.com/ava-labs/avalanchego.git
fi

cd avalanchego
rm -rf build
if [[ $# -gt 0 ]]
then
    git pull origin master
    git fetch --tags
    git checkout tags/$1 
    bash scripts/build.sh
else
    git pull origin master
    bash scripts/build.sh
fi

mkdir -p ~/.avalanchego/chains/C

cat > ~/.avalanchego/chains/C/config.json <<EOF
{
  "snowman-api-enabled": false,
  "coreth-admin-api-enabled": false,
  "coreth-performance-api-enabled": false,
  "net-api-enabled": true,
  "rpc-gas-cap": 2500000000,
  "rpc-tx-fee-cap": 100,
  "eth-api-enabled": true,
  "personal-api-enabled": false,
  "tx-pool-api-enabled": true,
  "debug-api-enabled": true,
  "web3-api-enabled": true,
  "local-txs-enabled": true,
  "pruning-enabled": false,
  "api-max-duration": 0,
  "api-max-blocks-per-request": 0,
  "allow-unfinalized-queries": true,
  "log-level": "info",
  "eth-apis": [
    "public-eth",
    "public-eth-filter",
    "net",
    "web3",
    "internal-public-eth",
    "internal-public-blockchain",
    "internal-public-transaction-pool"
  ]
}
EOF

(./build/avalanchego --public-ip=127.0.0.1 --http-port=9650 --staking-port=9651 --db-dir=../db/node0 --network-id=local --staking-tls-cert-file=$(pwd)/staking/local/staker1.crt --staking-tls-key-file=$(pwd)/staking/local/staker1.key >> ../node0.log 2>&1)&
(./build/avalanchego --public-ip=127.0.0.1 --http-port=9652 --staking-port=9653 --db-dir=../db/node1 --network-id=local --bootstrap-ips=127.0.0.1:9651 --bootstrap-ids=NodeID-7Xhw2mDxuDS44j42TCB6U5579esbSt3Lg --staking-tls-cert-file=$(pwd)/staking/local/staker2.crt --staking-tls-key-file=$(pwd)/staking/local/staker2.key >> ../node1.log 2>&1)&
(./build/avalanchego --public-ip=127.0.0.1 --http-port=9654 --staking-port=9655 --db-dir=../db/node2 --network-id=local --bootstrap-ips=127.0.0.1:9651 --bootstrap-ids=NodeID-7Xhw2mDxuDS44j42TCB6U5579esbSt3Lg --staking-tls-cert-file=$(pwd)/staking/local/staker3.crt --staking-tls-key-file=$(pwd)/staking/local/staker3.key >> ../node2.log 2>&1)&
(./build/avalanchego --public-ip=127.0.0.1 --http-port=9656 --staking-port=9657 --db-dir=../db/node3 --network-id=local --bootstrap-ips=127.0.0.1:9651 --bootstrap-ids=NodeID-7Xhw2mDxuDS44j42TCB6U5579esbSt3Lg --staking-tls-cert-file=$(pwd)/staking/local/staker4.crt --staking-tls-key-file=$(pwd)/staking/local/staker4.key >> ../node3.log 2>&1)&
(./build/avalanchego --public-ip=127.0.0.1 --http-port=9658 --staking-port=9659 --db-dir=../db/node4 --network-id=local --bootstrap-ips=127.0.0.1:9651 --bootstrap-ids=NodeID-7Xhw2mDxuDS44j42TCB6U5579esbSt3Lg --staking-tls-cert-file=$(pwd)/staking/local/staker5.crt --staking-tls-key-file=$(pwd)/staking/local/staker5.key >> ../node4.log 2>&1)&
echo "node started"

echo "wait 20 seconds for bootstraps..."
sleep 10

echo "get nodeId: "
curl -X POST --data '{
    "jsonrpc": "2.0",
    "method": "info.getNodeID",
    "params":{},
    "id": 1
}' -H 'content-type:application/json;' 127.0.0.1:9652/ext/info

echo "connected peers: "
curl -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"info.peers"
}' -H 'content-type:application/json;' 127.0.0.1:9652/ext/info

# echo "create user: "
# curl -X POST --data '{
#     "jsonrpc":"2.0",
#     "id"     :1,
#     "method" :"keystore.createUser",
#     "params" :{
#         "username":"user",
#         "password":"PfC77^%^2F"
#     }
# }' -H 'content-type:application/json;' 127.0.0.1:9652/ext/keystore

# echo "import key: "
# curl -X POST --data '{  
#     "jsonrpc":"2.0",    
#     "id"     :1,    
#     "method" :"avax.importKey", 
#     "params" :{ 
#         "username" :"user",   
#         "password":"PfC77^%^2F",    
#         "privateKey":"PrivateKey-ewoqjP7PxY4yr3iLTpLisriqt94hdyDFNgchSxGGztUrTXtNN"    
#     }   
# }' -H 'content-type:application/json;' 127.0.0.1:9652/ext/bc/C/avax

echo "pre-fund c chain address 0x8db97C7cEcE249c2b98bDC0226Cc4C2A57BF52FC private key 0x56289e99c94b6912bfc12adc093c9b51124f0dc54ac7a766b2bc5ccf558d8027"
echo "get pre-fund balance: "
curl --location --request POST 'http://127.0.0.1:9652/ext/bc/C/rpc' \
--header 'Content-Type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "method": "eth_getBalance",
    "params": [
        "0x8db97C7cEcE249c2b98bDC0226Cc4C2A57BF52FC",
        "latest"
    ],
    "id": 1
}'

# echo "get current validators:"
# curl --location --request POST 'http://127.0.0.1:9652/ext/bc/P' \
# --header 'Content-Type: application/json' \
# --data-raw '{
#     "jsonrpc": "2.0",
#     "method": "platform.getCurrentValidators",
#     "params": {
#         "subnetID":null,
#         "nodeIDs":[]
#     },
#     "id": 1
# }'