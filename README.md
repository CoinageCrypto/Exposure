![Exposure Logo](https://i.imgur.com/qX6iRSF.png "Exposure Logo")

The cryptocurrency for creative professionals.

![GitHub release](https://img.shields.io/github/release/CoinageCrypto/Exposure.svg)
![License](https://img.shields.io/github/license/CoinageCrypto/Exposure.svg)
[![Supported by Coinage](https://coina.ge/assets/supported-by-coinage-badge.svg)](https://coina.ge/?utm_source=github&utm_medium=badge&utm_campaign=exposure)

## Contents

This repository has two main components:

- `/contracts`: Has the Solidity smart contracts that underpin Exposure.
- `/website`: The public website. It's a bootstrap template so there's no real magic happening here, it's oldschool

## Building

To build the contracts, install `solc`, then:

1. `cd contracts`
2. `solc *.sol` with whatever options you want, e.g. `--abi` and/or `--bin`

To build the website:

1. `. `cd website`
2. `yarn`
3. `yarn start`

or if you want to build the static output, then `yarn build`.

## Further Help

Feel free to [reach out to us at Coinage](mailto:hello@coina.ge), we're happy to help!

