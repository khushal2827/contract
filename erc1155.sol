// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Piverse is ERC1155, Ownable {
    uint256 public maxSuppply;
    uint256 public totalSupply=0;


    constructor(uint256 _maxSuppply) ERC1155("") {
        maxSuppply = _maxSuppply;
    }
    
    function setmaxSupply(uint256 _maxSuppply) public onlyOwner{
       maxSuppply = _maxSuppply;
    }
    

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        require(totalSupply + 1 <= maxSuppply, "Total supply exceeds max supply" );
        _mint(account, id, amount, data);
        totalSupply=totalSupply + 1;
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        require(totalSupply + ids.length <= maxSuppply, "Total supply exceeds max supply" );
        _mintBatch(to, ids, amounts, data);
       totalSupply= totalSupply + ids.length;
    }
}
