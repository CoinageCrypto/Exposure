![Exposure Logo](https://i.imgur.com/qX6iRSF.png "Exposure Logo")

The cryptocurrency for creative professionals.

![GitHub release](https://img.shields.io/github/release/CoinageCrypto/Exposure.svg)
![License](https://img.shields.io/github/license/CoinageCrypto/Exposure.svg)
[![Supported by Coinage](https://coina.ge/assets/supported-by-coinage-badge.svg)](https://coina.ge/?utm_source=github&utm_medium=badge&utm_campaign=exposure)

## Contents

This repository has two main components:

- `/contracts`: Has the Solidity smart contracts that underpin Exposure.
- `/website`: The public website. It's a bootstrap template so there's no real magic happening here, it's oldschool

## Addresses

The contracts are deployed to Mainnet here:

- `token.sol`: [0xf79C2cc623c9317725712cF1b1b980464507a70A](https://etherscan.io/token/0xf79c2cc623c9317725712cf1b1b980464507a70a)
- `crowdsale.sol`: [0xB7D9372DbcEDfFd7b58a15516e0b156204b764a8](https://etherscan.io/address/0xB7D9372DbcEDfFd7b58a15516e0b156204b764a8)

If you want to buy some Exposure, send ETH to the crowdsale contract and you'll receive EXPO back at [the rate on this page](https://etherscan.io/address/0xB7D9372DbcEDfFd7b58a15516e0b156204b764a8#readContract).

If you're concerned about the owner of the contract front-running your transaction with a different exchange rate you can call the `buyTokensAtRate` function instead.

## Building

To build the contracts, install `solc`, then:

1. `cd contracts`
2. `solc *.sol` with whatever options you want, e.g. `--abi` and/or `--bin`

Or from your browser, you can:

1. Use [solidifer](https://solidifier.coina.ge) to flatten the contracts.
2. Put the flattened version into [Remix](https://remix.ethereum.org/).

To build the website:

1. `cd website`
2. `yarn`
3. `yarn start`

or if you want to build the static output, then `yarn build`.

## Further Help

Feel free to [reach out to us at Coinage](mailto:hello@coina.ge), we're happy to help!

