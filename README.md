# Ethereum local private network

Scripts to build ethereum local private network.

## Modify params

Specific the `geth` client path in `_param.sh`.

## Get started

- start network: `./start.sh`
- execute cmd: `./exec.sh eth.blockNumber`
- attach console `./attach.sh`
- stop network: `./stop.sh`
- clean data and logs: `./clean.sh`

## Per-funded address

100 eth per-funded:

address: 0x66615f83A1FE0A17166ddD4E1FE086c733937552

privateKey: dfec21aeef5249b896794bf85d86f02ed21c13c073d248cf1175b19b92eecbc8

## Miner coinbase

address: 0x888C2Cb5EE08F77f8D2d308E4E9554C101e04C2c

privateKey: 10ae8eb58ec3ef20e6fad9097646492bb4ee49d146a2140fbb4ec8a07ba59cd1

## Rpc & websockts

Node0:

- rpc: http://127.0.0.1:5000
- websocket: ws://127.0.0.1:6000

Node1:

- rpc: http://127.0.0.1:5001
- websocket: ws://127.0.0.1:6001

Node2:

- rpc: http://127.0.0.1:5002
- websocket: ws://127.0.0.1:6002
