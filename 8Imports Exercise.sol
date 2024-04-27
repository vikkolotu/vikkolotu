// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "./SillyStringUtils.sol";

contract ImportsExercise {
		string private salt = "ccc";
    SillyStringUtils.Haiku public haiku;

    function saveHaiku(string calldata line1, string calldata line2, string calldata line3) public payable {
        haiku = SillyStringUtils.Haiku({
            line1: line1,
            line2: line2,
            line3: line3
        });
    }

    function getHaiku() public view returns(SillyStringUtils.Haiku memory){
        return haiku;
    }

    function shruggieHaiku() public view returns(SillyStringUtils.Haiku memory){
        SillyStringUtils.Haiku memory _haiku = SillyStringUtils.Haiku({
            line1: haiku.line1,
            line2: haiku.line2,
            line3: SillyStringUtils.shruggie(haiku.line3)
        });

        return _haiku;
    } 
}
