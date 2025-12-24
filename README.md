# Smart Contract Lottery

A decentralized **Lottery Smart Contract** built in **Solidity** using **Foundry**.  
This project demonstrates how to build, test, and deploy a lottery contract that allows participants to enter by sending ETH and selects a winner based on on-chain logic (e.g., pseudo-random or randomness oracle). :contentReference[oaicite:0]{index=0}

---

## 📌 Table of Contents

- [Overview](#overview)  
- [Features](#features)  
- [Prerequisites](#prerequisites)  
- [Getting Started](#getting-started)  
- [Usage](#usage)  
  - [Build](#build)  
  - [Test](#test)  
  - [Deploy](#deploy)  
  - [Interact](#interact)  
- [Project Structure](#project-structure)  
- [Security Notes](#security-notes)  
- [Contributing](#contributing)  
- [License](#license)

---

## 🧠 Overview

This project contains a Solidity smart contract for a lottery system where users can participate by sending ETH. The winner is chosen programmatically after entries are closed. You can run and test this on local forks or public testnets.

---

## 🚀 Features

- Solidity-based lottery logic  
- Built and tested using **Foundry** — fast Rust-based Ethereum dev toolkit  
- Scripts for deployment and interaction  
- Unit tests included  
- Gas snapshot support  

*(Add more specific features if your contract uses Chainlink VRF, Automation, or other integrations.)* :contentReference[oaicite:1]{index=1}

---

## 🧰 Prerequisites

Make sure you have the following installed:

- **Foundry** — required to build and test  
  ```bash
  curl -L https://foundry.paradigm.xyz | bash
  foundryup


## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
