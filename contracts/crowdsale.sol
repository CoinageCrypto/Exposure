pragma solidity 0.4.24;

import "./open-zeppelin/contracts/crowdsale/Crowdsale.sol";
import "./open-zeppelin/contracts/ownership/Ownable.sol";
import "./token.sol";

contract ExposureCrowdSale is Crowdsale, Ownable {
    constructor(uint256 rate_, address wallet_, ExposureToken token_) public 
        Crowdsale(rate_, wallet_, token_)
    {
    }

    /**
    * @dev Allows the owner to withdraw any Exposure in the crowdsale contract
    * @param _amount Exposure to withdraw
    */
    function withdraw(uint256 _amount)
        onlyOwner
        external
    {
        token.transfer(owner, _amount);
    }

    /**
    * @dev Allows the owner to change the funds wallet address
    * @param _wallet The new funds wallet address
    */
    function updateWallet(address _wallet)
        onlyOwner
        external
    {
        wallet = _wallet;
    }

    /**
    * @dev Allows the owner to change the exchange rate
    * @param _rate The new rate of the crowdsale
    */
    function updateRate(uint256 _rate)
        onlyOwner
        external
    {
        rate = _rate;
    }

    /**
    * @dev Allows a participant to ensure they receive a specfic rate when purchasing to prevent front-running by the owner
    * @param _beneficiary The recipient of all that sweet sweet Exposure.
    * @param _guaranteedRate The rate the recipient wants to ensure they receive.
    */
    function buyTokensAtRate(address _beneficiary, uint256 _guaranteedRate)
        external
        payable
    {
        // Ensure the rate we're providing is the one the user asks for or revert the transaction.
        require(rate == _guaranteedRate);

        // Ok, we're good to execute the buy.
        return buyTokens(_beneficiary);
    }
}