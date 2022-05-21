pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract BridgeBNB is Ownable, ReentrancyGuard {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    address public USDT = 0x55d398326f99059fF775485246999027B3197955;
    address public coinToken = 0xc558da8ed9241B124450704843eaFB04888e1540;

    function deposit(uint256 _type, uint256 amount) external payable onlyOwner {
        if (_type == 2) {
            IERC20(USDT).transferFrom(msg.sender, address(this), amount);
        }
    }

    function withdraw(
        uint256 _type,
        uint256 amount,
        address to
    ) external onlyOwner {
        if (_type == 1) {
            payable(to).transfer(amount);
        } else IERC20(coinToken).transfer(to, amount);
    }

    function setTokens(address _USDT, address _coinToken) external onlyOwner {
        USDT = _USDT;
        coinToken = _coinToken;
    }

    function removeStuckETH() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function removeStuckToken(address token) external onlyOwner {
        IERC20(token).transfer(owner(), IERC20(token).balanceOf(address(this)));
    }
}
