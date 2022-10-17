//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IERC20.sol";
contract week5 is IERC20 {
    mapping(address => uint256) private _balances;

    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name ;
    string private _symbol;
    uint8 private _decimal;

    constructor() {
        _name = "Oreoluwa";
        _symbol = "ORE";
        _decimal = 18;
        uint amount = 1000000 * 10**_decimal;
        _totalSupply+= amount;
        _balances[msg.sender] = _totalSupply;
    }


    //returns the totalSupply of token
    function totalSupply() external view returns(uint) {
        return _totalSupply;
    }

    //Returns the balance of provided address account
    function balanceOf(address account) external view returns(uint) {
        return _balances[account];
    }

    //transfers tokens of size amount from the caller to provided address to
    function transfer(address to, uint256 amount) external returns (bool) {
        require(to != address(0));
        require(_balances[msg.sender] >= amount, "insufficient balance");
        _balances[msg.sender]-= amount;
        _balances[to]+= amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    //return decimals of token, set in the constructor
    function decimals() public view returns (uint8) {
        return _decimal;
    }

    //returns token name
    function name() public view returns(string memory) {
        return _name;
    }

    //returns token symbol
    function symbol() public view returns(string memory) {
        return _symbol;
    }
}