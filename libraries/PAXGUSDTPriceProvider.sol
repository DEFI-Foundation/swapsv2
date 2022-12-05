// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.7;

import '@chainlink/contracts/src/v0.8/interfaces/AggregatorInterface.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import './IPriceProvider.sol';

contract PriceProvider is IPriceProvider, Ownable {
    AggregatorInterface public priceProviderPAXGeth;    //18 ETH mainnet
    AggregatorInterface public priceProviderETHusd;     //8 ETH mainnet
    AggregatorInterface public priceProviderUSDTusd;    //8 ETH mainnet

    string private description;

    constructor(
        AggregatorInterface _priceProviderPAXGeth,
        AggregatorInterface _priceProviderETHusd,
        AggregatorInterface _priceProviderUSDTusd,
        string memory _description
    ) {
        priceProviderPAXGeth = _priceProviderPAXGeth;
        priceProviderETHusd = _priceProviderETHusd;
        priceProviderUSDTusd = _priceProviderUSDTusd;

        description = _description;
    }

    function getPrice() external view override returns (uint256) {
        return
            uint256(
                ((priceProviderPAXGeth.latestAnswer() *
                    priceProviderETHusd.latestAnswer()) /
                    priceProviderUSDTusd.latestAnswer()) / 
                    (10**10)
            );
    }

    function getDescription() external view override returns (string memory) {
        return description;
    }
}
