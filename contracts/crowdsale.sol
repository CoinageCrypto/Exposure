pragma solidity 0.4.24;

import "./open-zeppelin/contracts/ownership/Ownable.sol";
import "./token.sol";

contract ExposureCrowdSale is Ownable {
    using SafeMath for uint256;

    // The address of the token contract which we'll be interacting with.
    ExposureToken public exposure;

    // Amount of Exposure you get for every 1 ETH
    uint256 public exchangeRate;

    // Amount of Exposure sold via this contract
    uint256 public exposureSold;

    // Amount of ETH collected via this contract
    uint256 public ethCollected;

    // The address which this contract forwards its ETH to.
    address public fundsWallet;

    /**
    * @dev The constructor sets the original exchange rate of the contract and the address of the token.
    */
    constructor(uint256 _exchangeRate, address _fundsWallet) public {
        exchangeRate = _exchangeRate;
        fundsWallet = _fundsWallet;

        exposureSold = 0;
        ethCollected = 0;
    }

    /**
    * @dev The default function purchases Exposure.
    */
    function () external payable {
        purchase();
    } 

    // -----------------------------
    // VIEWS
    // -----------------------------

    /**
    * @dev Allow users to easily query the amount available for purchase.
    */
    function availableExposure() external view returns (uint256) {
        return exposure.balanceOf(this);
    }

    // -----------------------------
    // SETTERS
    // -----------------------------

    /**
    * @dev The owner is able to change the exchange rate.
    */
    function setExchangeRate(uint256 _newExchangeRate) external onlyOwner {
        exchangeRate = _newExchangeRate;

        emit ExchangeRateChanged(exchangeRate);
    }

    /**
    * @dev The owner is able to change the funds wallet, which is where any ETH we
    *      receive goes.
    */
    function setFundsWallet(address _newFundsWallet) external onlyOwner {
        fundsWallet = _newFundsWallet;

        emit FundsWalletChanged(fundsWallet);
    }

    /**
    * @dev The owner is able to withdraw any Exposure the contract has.
    */
    function withdraw(uint256 amount) external onlyOwner {
        exposure.transfer(owner, amount);
    }

    // -----------------------------
    // PURCHASE
    // -----------------------------

    /**
    * @dev The purchase function allows users to purchase Exposure when they aren't
    *      concerned about the owner front running the exchange rate.
    *
    *      For more about front running, read here:
    *      https://consensys.github.io/smart-contract-best-practices/known_attacks/#transaction-ordering-dependence-tod-front-running
    */
    function purchase() public payable returns (bool) {
        uint256 amountPurchased = msg.value.mul(exchangeRate);

        // Send the ETH to our funds wallet.
        fundsWallet.transfer(msg.value);

        // Send the Exposure to the purchaser.
        exposure.transfer(msg.sender, amountPurchased);

        // Note: No emits here because we're expecting you to watch the transfer events on the
        //       token contract if you want to see when people purchase.
        return true;
    }

    /**
    * @dev The purchaseWithExchangeRate function allows users to purchase Exposure and
    *      guarantee that they will receive a specific amount of Exposure in return.
    *      If the owner of the contract tries to front run their transaction, the call
    *      will revert.
    *
    *      For more about front running, read here:
    *      https://consensys.github.io/smart-contract-best-practices/known_attacks/#transaction-ordering-dependence-tod-front-running
    */
    function purchaseWithExchangeRate(uint256 guaranteedExchangeRate) external payable returns (bool) {
        require(exchangeRate == guaranteedExchangeRate);

        return purchase();
    }

    // Emitted whenever the owner of the contract changes the exchange rate.
    event ExchangeRateChanged(uint256 newExchangeRate);

    // Emitted whenever the owner of the contract changes the funds wallet.
    event FundsWalletChanged(address newFundsWallet);

    // Note, there is no event for purchase as you can subscribe to transfer events on the
    // actual token contract if you want to monitor purchases.
}