
pragma solidity ^ 0.8.0 ;

//Factory contract
//stores child contract addresses
contract RealEstateFactory{

  //array to store child contract addresses
  //we dont use centralised database for storing as blockchain cryptographically secure
  address [] public realestateAssets ;
  
  //creating a function creates child contract address that does a trnasaction regarding the asset
  //child contract address get srtored in the block chain
  function createChildContract (string memory _location , uint256 _valuation) payable public {
    address newRealEstateAsset = new RealEstateAsset(string memory  _location,uint256 _valuation,address _owner );
    newRealEstateAsset.push(realestateAssets);
    }
    
    //function to read the child contract addresss in block chain
    function readChildContract() public view returns(address []) {
      return realestateassets;
    }
 }
 
 
 
//child contract
//referred to as asset
contract RealEstateAsset{
  string memory public location;
  uint256 public valuation;
  address public owner;
  
  constructor(string memory  _location,uint256 _valuation,address _owner ) public {
  location = _location;
  valuation = _valuation;
  owner = _owner;
  }
  }
