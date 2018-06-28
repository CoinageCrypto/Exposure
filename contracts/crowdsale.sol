pragma solidity 0.4.24;

import "./open-zeppelin/contracts/crowdsale/Crowdsale.sol";


/**
* @dev This contract is here to show that we're using OpenZeppelin's Crowsdsale contract.
*/

contract ExposureCrowdSale is Crowdsale {
    constructor(uint256 rate_, address wallet_, ERC20 token_) public 
        Crowdsale(rate_, wallet_, token_)
    {
        // We don't need to do anything here. It's all already been written.
    }
}