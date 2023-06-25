// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {LessonNineSolver} from "../src/LessonNineSolver.sol";

contract DeployLessonNineSolver is Script {
    function run() external returns (LessonNineSolver) {
        vm.startBroadcast();
        LessonNineSolver lessonNineSolver = new LessonNineSolver();
        vm.stopBroadcast();
        return lessonNineSolver;
    }
}
