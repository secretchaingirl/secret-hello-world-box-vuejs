# Hello World Secret Box (VueJS + Typescript + Vite)

Welcome to your first "Hello World!" secret box. In this box you'll find everything you need to learn the essentials of secret contracts on Secret.

WiP

TODO:
- Tutorial content
- Modify scripts to use Secret.JS tests (better way of working with the local blockchain, deploying, getting the contract address, etc.
- Add query MOTD to frontend
- Add Update form for frontend

## Local Dev Environment Setup

- Setup Rust environment
- Install Node
- Install Yarn
- Install Docker

### Setup Secret Contract

Change into the contracts directory

```
cd contracts
```

Compile contract

```
cargo wasm
```

Run unit tests

```
RUST_BACKTRACE=1 cargo unit-test
```

Run integration tests

```
cargo integration-test
```

Generate schema

```
cargo schema
```

Run contract optimizer

```
docker run --rm -v "$(pwd)":/contract \
  --mount type=volume,source="$(basename "$(pwd)")_cache",target=/code/target \
  --mount type=volume,source=registry_cache,target=/usr/local/cargo/registry \
  enigmampc/secret-contract-optimizer  
````

Run secretdev local blockchain

```
docker run -it --rm \
 -p 26657:26657 -p 26656:26656 -p 1337:1337 \
 -v $(pwd):/root/code \
 --name secretdev enigmampc/secret-network-sw-dev
```

Deploy contract to secretdev

```
docker exec -w /root/code -it secretdev scripts/deploy.sh
```

Instantiate contract

```
docker exec -w /root/code -it secretdev scripts/instantiate.sh
```

Get contract address

```
secretd query compute list-contract-by-code 1
```

Use contract address to query the MOTD

```
CONTRACT=secret1da6yclxggkug6ec9vjcpretcfh6w4f6j34gt65

secretd query compute query $CONTRACT '{"get_motd": {}}'
```

## Launch dApp

Add Secret.JS

```
yarn add secretjs@beta
```

Install dependencies

```
yarn install
```

Run development server

```
yarn dev
```

Open browser at `http://localhost:3000`.


## Resources

- [SecretJS Tests](https://github.com/scrtlabs/secret.js/blob/master/test/test.ts)

