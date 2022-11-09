//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract savingsApp {

    receive() external payable{}
    address public owner;
    uint public lockTime;
    bytes2 public savingsID;
    bytes2 public lockID;

    constructor() {
        owner = msg.sender;
        savingsID = bytes2(keccak256(abi.encodePacked(msg.sender,block.timestamp)));
        lockID = bytes2(keccak256(abi.encodePacked(block.number, block.difficulty)));
    }


    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    mapping (bytes2 => uint) public savingsBalance;
    mapping (bytes2 => uint) public lockedBalance;


    function save(bytes2 _savingsID) public payable onlyOwner  {
        require(_savingsID == savingsID);
        savingsBalance[_savingsID] += msg.value;
    }

    function savebyLock(bytes2 _lockID, uint _lockTime) public payable onlyOwner {
        require(_lockID == lockID);
        lockedBalance[_lockID] += msg.value;
        lockTime = block.timestamp + _lockTime;
    }

}