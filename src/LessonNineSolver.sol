// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

interface LessonNine {
    function solveChallenge(uint256 randomGuess, string memory yourTwitterHandle) external;
}

contract LessonNineSolver is IERC721Receiver {
    address private i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function solveLessonNine(address targetContract, string memory twitterHandle) public {
        uint256 correctAnswer =
            uint256(keccak256(abi.encodePacked(address(this), block.prevrandao, block.timestamp))) % 100000;

        LessonNine(targetContract).solveChallenge(correctAnswer, twitterHandle);
    }

    function onERC721Received(address, address, uint256 tokenId, bytes calldata) external override returns (bytes4) {
        IERC721(msg.sender).transferFrom(address(this), i_owner, tokenId);

        return IERC721Receiver.onERC721Received.selector;
    }
}
