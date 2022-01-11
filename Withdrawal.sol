// used when any erroneous third party smart contract blocks subsequenct transaction to other third party contracts

pragma solidity ^0.8.0 ;

contract Withdrawal {

  //mapping of client contract address to amount of purchase
  mapping (address=>uint256) public clients;
  
  function purchase () payable {
    require(msg.value > 1 ether ) ;
    clients[msg.sender]= msg.value;
    }
    
  function  withdraw() payable {
    uint256 refund = clients[msg.sender]
    require ( refund > 1 ether );
    client[msg.sender]=0;
    require(msg.sender.send(refund);
  }

}
