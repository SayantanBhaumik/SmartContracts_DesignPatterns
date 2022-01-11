// used in dAPPs when there is multiple smart contracts
//keeping track of contract name and addresses

pragma solidity ^0.8.0 ;

contract NameRegistry {

  //custom data structure to store detail about multiple contract
  struct SmartContractDetails {
    address public owner;
    address public contractAddress;
    uint256 public version;
}

//mapping of name of the smart contract to details
mapping ( string => SmartContractDetails) public nameRegistry;

//function to register name of smart contracts
function registerNameofContract (string memory _name, address _contractAddress ,uint256 _version) public returns (bool){
  require ( _version >= 0.0);
  
  SmartContractDetails memory detailsOfContract = nameRegistry[_name];
  
  //if contract details is not in the registry create it
  if (detailsOfContract.contractAddress == address(0)){
  
     //populating the struct with data
    detailsOfContract = SmartContractDetails({
                      owner = msg.sender;
                      contractAddress = _contractAddress;
                      version = _version;
    });
  }
  
  //else if new contract version and address after new update deployment
  else {
                     detailsOfContract.contractAddress = _contractAddress;
                     detailsOfContract.version = _version;
  }
    
    //update name registry
    nameRegistry[_name] = detailsOfContract;
    return true;
    
    //getter function
    function getContractDetails(string memory _name)public view returns(address , uint256 ){
      return nameRegistry[_name].contractAddress,
             nameRegistry[_name].version;
      
    
  
}
