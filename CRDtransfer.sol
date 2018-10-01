pragma solidity ^0.4.0;

contract CRDTransferTo {
    function() public payable {}
    
    function getBalance() view returns (uint256) {
        return address(this).balance;
    }
}

contract CRDTransferFrom {
    address crd_wallet;
    uint amount;
    CRDTransferTo private _instance;
    
    constructor() public {
        _instance = new CRDTransferTo();   
    }
    
    function getBalance() private returns (uint256) {
        return address(this).balance;
    }
    
    function getBalanceOfInstance() public returns (uint) {
        return _instance.getBalance();
    }
    
    function () public payable {
        uint fee = (amount * 5)/100;
        if(getBalance() > fee) {
            crd_wallet.transfer(fee);
            if (getBalance() > amount) {
                address(_instance).transfer(amount);      
            }
        }
    }
}