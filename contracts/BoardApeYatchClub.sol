// contracts/BoardApeYatchClub.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2; 

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract BoardApeYatchClub is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {}

    function mint(string memory tokenURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    function mintForUser(address account, uint256 id) external {
        _mint(account, id);
    }

    function burnMyNFT(uint256 tokenId) external {
        require(_isApprovedOrOwner(_msgSender(), tokenId), "You must be owner to burn");
        _burn(tokenId);
    }
}