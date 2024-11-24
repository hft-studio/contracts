// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";

contract HFTToken is ERC20, Ownable, Pausable {
    constructor(
        string memory name,
        string memory symbol
    ) ERC20(name, symbol) Ownable(msg.sender) {}
    
    /**
     * @dev Mints new tokens to the specified address
     * @param to The address that will receive the minted tokens
     * @param amount The amount of tokens to mint
     */
    function mint(address to, uint256 amount) external onlyOwner whenNotPaused {
        require(to != address(0), "HFTToken: mint to zero address");
        _mint(to, amount);
    }

    /**
     * @dev Pauses token minting
     */
    function pause() external onlyOwner {
        _pause();
    }

    /**
     * @dev Unpauses token minting
     */
    function unpause() external onlyOwner {
        _unpause();
    }
}