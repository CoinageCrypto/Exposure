pragma solidity 0.4.24;

import "./open-zeppelin/contracts/token/ERC20/StandardBurnableToken.sol";

contract ExposureToken is StandardBurnableToken {
    string public constant name = "Exposure";
    string public constant symbol = "EXPO";
    uint8 public constant decimals = 18;

    constructor() public 
    {
        // 1 BILLION EXPOSURE
        totalSupply_ = 1000000000 ether;
        
        // Owner starts with all of the Exposure.
        balances[msg.sender] = totalSupply_;
        emit Transfer(0, msg.sender, totalSupply_);
    }
}