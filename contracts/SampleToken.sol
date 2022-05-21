pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20_Token_Sample is ERC20, ERC20Burnable {
    constructor() ERC20("2022Moon", "2022M") {
        _mint(msg.sender, 100_000_000_000 * 10**18);
    }
}
