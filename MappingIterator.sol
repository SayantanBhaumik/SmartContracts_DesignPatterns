//Mapping data structure in solidity cannot be iterated

pragma solidity ^0.8.0;

contract MappingIterator {

//mapping of key to contract addresses
mapping (uint256 = > address) public contractRegistry;

//dynamic array of mapping keys
uint256[] public keys ;

//setter 
function setRegistry(uint256 _key , address _address) public returns(bool){

    // key array has key , address is populated
    bool currentStatus = keys[key] != address(0);
    
    if (!currentStatus){
      keys.push(_key);
    }
    
    //update registry
    keys[_key]=_address;
    
    return true;
}

//getter
function getNumberOfKeys() public view returns(uint16){
  return keys.length;
}

function getElementatindex(uint16 _index) public view returns(uint16){
  return contractRegistry[keys[_index]];
  }
 
 function getAddress(uint16 _key) public view returns(address){
      return contractRegistry[_key];
 }

}
