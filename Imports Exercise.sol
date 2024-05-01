// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

// Importing the SillyStringUtils contract
import "./SillyStringUtils.sol";

contract ImportsExercise {
    // Define a variable to store the haiku
    SillyStringUtils.Haiku public haiku;

    // Event emitted when a haiku is saved
    event HaikuSaved(string line1, string line2, string line3);

    // Modifier to ensure that the caller has paid enough to save a haiku
    modifier paidEnough() {
        require(msg.value >= 1 ether, "Insufficient ether sent");
        _;
    }

    // Function to save a haiku
    function saveHaiku(string memory line1, string memory line2, string memory line3) public payable paidEnough {
        // Emit an event to indicate that a haiku has been saved
        emit HaikuSaved(line1, line2, line3);

        // Create a new haiku struct and store it
        haiku = SillyStringUtils.Haiku({
            line1: line1,
            line2: line2,
            line3: line3
        });
    }

    // Function to retrieve the stored haiku
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
