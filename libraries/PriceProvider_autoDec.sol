// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.7;

import '@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import './IPriceProvider.sol';

contract PriceProvider is IPriceProvider, Ownable {
    AggregatorV3Interface public priceProvider;
    string public description;

    constructor(
        AggregatorV3Interface _priceProvider,
        string memory _description
    ) {
        priceProvider = _priceProvider;
        description = _description;
    }

    function getPrice() external view override returns (uint256) {
        (, int256 price, , , ) = priceProvider.latestRoundData();
        uint256 decimalNR = priceProvider.decimals();

        if (decimalNR > 8) {
            return uint256(price) / (10**(decimalNR - 8));
        }
        if (decimalNR < 8) {
            return uint256(price) * (10**(8 - decimalNR));
        }

        return uint256(price);
    }

    function getDescription() external view override returns (string memory) {
        return description;
    }
}
