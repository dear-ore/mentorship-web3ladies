//SPDX-License-Identifier: MIT
pragma solidity 0.8.16;
contract wallet {
    receive() external payable {}
    address payable public owner = payable(msg.sender);

    event fundSent(string message);
    event fundReceived();
    error insufficientFunds();

    modifier onlyOwner() {
        require (owner == msg.sender);
        _;
    }

    function receiveEth() public payable {
        if(msg.sender.balance < msg.value) {
            revert insufficientFunds();
        }
        emit fundReceived();
    }


    function sendEth(uint amount, address payable receiver) public onlyOwner {
        receiver.transfer(amount);
        emit fundSent("Funds transferred successfully");
    }

}
