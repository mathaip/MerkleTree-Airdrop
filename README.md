### Instructions for use

1. git clone this repo  

2. npm install

3. npm start

4. npm test



### High Level Design

Using the Merkle Tree Airdrop We can deploy any number of coins through one cheap transaction.

The tokens can be stored either on or offchain

The MerkleProof.sol file creates the proof for the merkle root and verifies it, while the merkleAirdrop.sol
allows users to claim their tokens via efficient airdrop by verifying their data against the merkle tree proof.
