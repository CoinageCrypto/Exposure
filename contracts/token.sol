pragma solidity 0.4.24;

import "./open-zeppelin/contracts/token/ERC20/StandardBurnableToken.sol";

contract ExposureToken is StandardBurnableToken {
    string public constant name = "Exposure";
    string public constant symbol = "EXPO";
    uint8 public constant decimals = 18;
}