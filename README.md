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

## Default C chain config

https://docs.avax.network/build/references/avalanchego-config-flags/#c-chain-configs

```json
{
  "snowman-api-enabled": false,
  "coreth-admin-api-enabled": false,
  "coreth-admin-api-dir": "",
  "eth-apis": [
    "public-eth",
    "public-eth-filter",
    "net",
    "web3",
    "internal-public-eth",
    "internal-public-blockchain",
    "internal-public-transaction-pool"
  ],
  "continuous-profiler-dir": "",
  "continuous-profiler-frequency": 900000000000,
  "continuous-profiler-max-files": 5,
  "rpc-gas-cap": 50000000,
  "rpc-tx-fee-cap": 100,
  "preimages-enabled": false,
  "snapshot-async": true,
  "snapshot-verification-enabled": false,
  "pruning-enabled": true,
  "allow-missing-tries": false,
  "populate-missing-tries-parallelism": 1024,
  "metrics-enabled": true,
  "metrics-expensive-enabled": false,
  "local-txs-enabled": false,
  "api-max-duration": 0, // Default to no maximum
  "ws-cpu-refill-rate": 0,
  "ws-cpu-max-stored": 0,
  "api-max-blocks-per-request": 0, // Default to no maximum
  "allow-unfinalized-queries": false,
  "allow-unprotected-txs": false,
  "keystore-directory": "",
  "keystore-external-signer": "",
  "keystore-insecure-unlock-allowed": false,
  "remote-tx-gossip-only-enabled": false,
  "tx-regossip-frequency": 60000000000,
  "tx-regossip-max-size": 15,
  "log-level": "info",
  "offline-pruning-enabled": false,
  "offline-pruning-bloom-filter-size": 512, // MB
  "offline-pruning-data-directory": "",
  "max-outbound-active-requests": 8
}
```

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

doc: https://docs.avax.network/build/tools/postman-avalanche-collection

## Notes

The block number will keeps 0 in local network if you don't send transation.

## Reference

create-a-local-test-network: https://docs.avax.network/build/tutorials/platform/create-a-local-test-network/#manually
https://avatools.io/

convert x-chain private to c-chain private key:

- https://github.com/ava-labs/avalanchego/issues/1043

- https://github.com/ava-labs/avalanche-docs/issues/661

integrate-with-metamask: https://docs.avax.network/build/tutorials/platform/fund-a-local-test-network/#integrate-with-metamask
