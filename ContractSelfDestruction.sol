//Self Destruction Design pattern
//contract is terminated and removed from blockchain after stipulated time/purpose is over
//after destruction no transaction is logged

pragma solididty ^0.8.0;

contract SelfDestruction {
  address public owner;
  uint256 public _value;
  
  constructor() public {
  owner= msg.sender;
  }
  
  function setValue(uint256 value) public {
  _value = value;
  }
  
  //modifier so that only owner can destroy the contract
  modifier onlyOwner {
    require(owner==msg.sender);
    _;
  }
  
  //function responsible for destruction of smart contract
  function destroySmartContract() public  onlyOwner{
    suicide(owner);
  
}

