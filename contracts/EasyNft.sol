// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTItem1155 is ERC1155 {
    uint256 private _tokenIds;
    mapping(uint256 => string) private _uris;
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    
    constructor(string memory first_metadataURL, address creater) ERC1155(first_metadataURL) {
        _mint(creater, 0,1,"");
        _uris[0] = first_metadataURL;
    }
    
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool)  {
        return super.supportsInterface(interfaceId);
    }
    
    function uri(uint256 tokenId) override public view returns (string memory)  {
        return(_uris[tokenId]);
    }
    
    function setTokenUri(uint256 tokenId, string memory _uri) public {
        require(bytes(_uris[tokenId]).length == 0, "Cannot set uri twice"); 
        _uris[tokenId] = _uri; 
    }
    
    function mint(address creater,string memory metadataURL) public returns (uint){
        
        _mint(creater,0,1,"");
        _uris[0] = metadataURL;
        
        return 0;
    }
}

contract EasyNft {

  mapping(address => bool) public authorized;
  address public authorizedReceiver;
  uint256 public mintPrice = 0.0001 ether;

  mapping(string => mapping(address => address)) addressContractByTokenId;

  event Withdraw(address from, address to, uint256 amount);

  constructor() {}

  function setAuthorizedReceiver(address _receiver) external {
      authorizedReceiver = _receiver;
      authorized[_receiver] = true;
  }

  function withdraw(uint256 amount) external {
      require(authorized[msg.sender], "Not authorized to withdraw");
      require(address(this).balance >= amount, "Insufficient contract balance");
      payable(msg.sender).transfer(amount);

      emit Withdraw(address(this), msg.sender, amount);
  }

//   function mint(string memory tokenId, string memory metadataUrl) external payable {
//       require(msg.value >= mintPrice, "Insufficient funds to mint NFT");

//       address contractAddress = addressContractByTokenId[tokenId][msg.sender];

//       if (contractAddress != address(0)) {
//         NFTItem1155 nftContract = NFTItem1155(contractAddress);
//         nftContract.mint(msg.sender, metadataUrl);
//       } else {
//         address newContractAddress = address(new NFTItem1155(metadataUrl, msg.sender));
//         addressContractByTokenId[tokenId][msg.sender] = newContractAddress;
//       }
//   }
  function mint(string memory tokenId) external payable {
      require(msg.value >= mintPrice, "Insufficient funds to mint NFT");

      address contractAddress = addressContractByTokenId[tokenId][msg.sender];

      if (contractAddress != address(0)) {
        NFTItem1155 nftContract = NFTItem1155(contractAddress);
        nftContract.mint(msg.sender, "https://www.strategle.tech/api/nft/metadata");
      } else {
        address newContractAddress = address(new NFTItem1155("https://www.strategle.tech/api/nft/metadata", msg.sender));
        addressContractByTokenId[tokenId][msg.sender] = newContractAddress;
      }
  }
}
