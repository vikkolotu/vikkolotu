// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

// Importing the SillyStringUtils contract
import "./SillyStringUtils.sol";

contract ImportsExercise {
    // Private salt for demonstration purposes
    string private salt = "ccc";
    
    // Define a variable to store the haiku
    SillyStringUtils.Haiku public haiku;

    // Function to save a haiku
    function saveHaiku(string calldata line1, string calldata line2, string calldata line3) public payable {
        // Create a new haiku struct and store it
        haiku = SillyStringUtils.Haiku({
            line1: line1,
            line2: line2,
            line3: line3
        });
    }

    // Function to get the stored haiku
    function getHaiku() public view returns(SillyStringUtils.Haiku memory){
        return haiku;
    }

    // Function to generate a "shruggie" haiku
    function shruggieHaiku() public view returns(SillyStringUtils.Haiku memory){
        // Create a copy of the stored haiku
        SillyStringUtils.Haiku memory _haiku = SillyStringUtils.Haiku({
            line1: haiku.line1,
            line2: haiku.line2,
            // Append a shruggie to the third line of the haiku
            line3: SillyStringUtils.shruggie(haiku.line3)
        });

        // Return the modified haiku
        return _haiku;
    } 
}
