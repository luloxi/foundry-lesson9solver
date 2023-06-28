// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import {LessonNine} from "./LessonNine.sol";

contract LessonNineSolver is IERC721Receiver, Ownable {
    function solveLessonNine(address targetContract, string memory twitterHandle) public onlyOwner {
        uint256 correctAnswer =
            uint256(keccak256(abi.encodePacked(address(this), block.prevrandao, block.timestamp))) % 100000;

        LessonNine(targetContract).solveChallenge(correctAnswer, twitterHandle);
    }

    function onERC721Received(address, address, uint256 tokenId, bytes calldata) external override returns (bytes4) {
        ERC721(msg.sender).transferFrom(address(this), owner(), tokenId);

        return IERC721Receiver.onERC721Received.selector;
    }
}
