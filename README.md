# Avalanche local private network

Scripts to build avalanche chain local private network.

## Get started

- start network: `./start.sh`
- stop network: `./stop.sh`
- clean data and logs: `./clean.sh`

## Init fund

50000000 AVAX per-fund in

C chain address: 0x8db97C7cEcE249c2b98bDC0226Cc4C2A57BF52FC

C chain private key: 0x56289e99c94b6912bfc12adc093c9b51124f0dc54ac7a766b2bc5ccf558d8027

## C chain Rpc & websockts

Node0:

- rpc: http://127.0.0.1:9652/ext/bc/C/rpc
- websocket: ws://127.0.0.1:9652/ext/bc/C/ws

Node1:

- rpc: http://127.0.0.1:9654/ext/bc/C/rpc
- websocket: ws://127.0.0.1:9654/ext/bc/C/ws

Node2:

- rpc: http://127.0.0.1:9656/ext/bc/C/rpc
- websocket: ws://127.0.0.1:9656/ext/bc/C/ws

## Api

https://docs.avax.network/build/tools/postman-avalanche-collection

postman collection: https://raw.githubusercontent.com/ava-labs/avalanche-postman-collection/master/Avalanche.postman_collection.json

## Notes

The block number will keeps 0 in local network if you don't send transation.

## Reference

create-a-local-test-network: https://docs.avax.network/build/tutorials/platform/create-a-local-test-network/#manually
https://avatools.io/

convert x-chain private to c-chain private key:

- https://github.com/ava-labs/avalanchego/issues/1043

- https://github.com/ava-labs/avalanche-docs/issues/661

integrate-with-metamask: https://docs.avax.network/build/tutorials/platform/fund-a-local-test-network/#integrate-with-metamask
