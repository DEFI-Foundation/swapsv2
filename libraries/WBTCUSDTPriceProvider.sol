// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.7;

import '@chainlink/contracts/src/v0.8/interfaces/AggregatorInterface.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import './IPriceProvider.sol';

contract PriceProvider is IPriceProvider, Ownable {
    AggregatorInterface public priceProviderWBTCbtc;    //8 ETH mainnet
    AggregatorInterface public priceProviderBTCusd;     //8 ETH mainnet
    AggregatorInterface public priceProviderUSDTusd;    //8 ETH mainnet

    string private description;

    constructor(
        AggregatorInterface _priceProviderBTCusd,
        AggregatorInterface _priceProviderWBTCbtc,
        AggregatorInterface _priceProviderUSDTusd,
        string memory _description
    ) {
        priceProviderBTCusd = _priceProviderBTCusd;
        priceProviderWBTCbtc = _priceProviderWBTCbtc;
        priceProviderUSDTusd = _priceProviderUSDTusd;

        description = _description;
    }

    function getPrice() external view override returns (uint256) {
        return
            uint256(
                (priceProviderBTCusd.latestAnswer() *
                    priceProviderWBTCbtc.latestAnswer()) /
                    priceProviderUSDTusd.latestAnswer()
            );
    }

    function getDescription() external view override returns (string memory) {
        return description;
    }
}
