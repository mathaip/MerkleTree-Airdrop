pragma solidity ^0.5.0;
import "openzeppelin-solidity/contracts/token/ERC20/MintableToken.sol";
import { MerkleProof } from "./MerkleProof.sol";
contract MerkleAirDrop {
  bytes32 public merkleRoot;
  IERC20 public token;
  mapping(address => bool) internal claimed;
  constructor(bytes32 _merkleRoot, IERC20 _token) public {
    merkleRoot = _merkleRoot;
    token = _token;
  }
  function claim(bytes32[] calldata _proof, uint256[] calldata _positions, uint256 _amount) external {
    require(token.balanceOf(address(this)) >= _amount, "senders balance is lower than amount");
    require(_proof.length == _positions.length,);
    require(!claimed[msg.sender],"user has already claimed their airdrop");
    require(MerkleProof.verify(_proof, _positions, merkleRoot, keccak256(abi.encodePacked(msg.sender, _amount))), "Invalid proof");
    claimed[msg.sender] = true;
    assert(token.transfer(msg.sender, _amount));
  }
}