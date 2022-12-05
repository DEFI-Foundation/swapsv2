// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC20/extensions/ERC20Wrapper.sol)

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract WPAXG is ERC20, Ownable {

    IERC20 public immutable underlying;

    uint256 public constant feeMult = 1000000;
    uint256 public feeRate = 200;

    constructor(IERC20 underlyingToken)
        ERC20("Wrapped Pax Gold token", "WPAXG")
    {
        underlying = underlyingToken;
    }

    /**
     * @dev See {ERC20-decimals}.
     */
    function decimals() public view virtual override returns (uint8) {
        try IERC20Metadata(address(underlying)).decimals() returns (uint8 value) {
            return value;
        } catch {
            return super.decimals();
        }
    }

    /**
     * @dev Allow a user to deposit underlying tokens and mint the corresponding number of wrapped tokens.
     */
    function depositFor(address account, uint256 amount)
        public
        virtual
        returns (bool)
    {
        SafeERC20.safeTransferFrom(underlying, _msgSender(), address(this), amount);
        uint256 taxedAmount = amount - getFeeFor(amount);
        _mint(account, taxedAmount);
        return true;
    }

    /**
     * @dev Allow a user to burn a number of wrapped tokens and withdraw the corresponding number of underlying tokens.
     */
    function withdrawTo(address account, uint256 amount)
        public
        virtual
        returns (bool)
    {
        _burn(_msgSender(), amount);
        SafeERC20.safeTransfer(underlying, account, amount);
        return true;
    }

    function setFeeRate(uint256 newRate) public onlyOwner {
        feeRate = newRate;
    }

    function getFeeFor(uint256 _value) public view returns (uint256) {
        if (feeRate == 0) {
            return 0;
        }

        return (_value * feeRate) / feeMult;
    }

    /**
    function setFeeRate(uint256 newRate) public onlyOwner {
     * @dev Mint wrapped token to cover any underlyingTokens that would have been transferred by mistake. Internal
     * function that can be exposed with access control if desired.
     */
    function _recover(address account) public onlyOwner returns (uint256) {
        uint256 value = underlying.balanceOf(address(this)) - totalSupply();
        _mint(account, value);
        return value;
    }

}
