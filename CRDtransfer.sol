pragma solidity ^0.4.0;

contract CRDTransferTo {
    function() public payable {
        
    }
    
    function getBalance() public returns (uint) {
        return address(this).balance;
    }
}

contract CRDTransferFrom {
    
    CRDTransferTo private _instance;
    
    constructor() {
        _instance = new CRDTransferTo();   
    }
    
    function getBalance() public returns (uint) {
        return address(this).balance;
    }
    
    function getBalanceOfInstance() public returns (uint) {
        return _instance.getBalance();
    }
    
    function () public payable {
        address(_instance).send(msg.value);
    }
}