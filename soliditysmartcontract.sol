// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZKPNFT {
    // Token data
    string public name = "ZKP NFT";
    string public symbol = "ZKPNFT";

    // Token ID tracker
    uint256 private _tokenIdCounter = 1;

    // Token ownership mapping
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _ownedToken;

    // Events
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    // Minting function with ZKP verification
    function mintZKPNFT() public {
        require(_ownedToken[msg.sender] == 0, "Already owns a token");
        require(_verifyProof(msg.sender), "ZKP verification failed");

        uint256 tokenId = _tokenIdCounter;
        _owners[tokenId] = msg.sender;
        _ownedToken[msg.sender] = tokenId;

        emit Transfer(address(0), msg.sender, tokenId);

        _tokenIdCounter += 1;
    }

    // View functions
    function ownerOf(uint256 tokenId) public view returns (address) {
        return _owners[tokenId];
    }

    function tokenOf(address owner) public view returns (uint256) {
        return _ownedToken[owner];
    }

    // Mock ZKP verification (placeholder for real proof logic)
    function _verifyProof(address user) internal pure returns (bool) {
        // Placeholder logic: always true for demonstration
        // Replace with actual proof verification in production
        return true;
    }
}
