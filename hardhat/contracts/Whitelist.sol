//SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

contract Whitelist {

    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // Create a mapping of WhitelistedAddresses
    // if an address is whitelisted, we would set it to true,it is
    // false by default for all other addresses.
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    //Setting the Max number of whitelisted addresses ^^

    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }
/**
    addAddressToWhitelist - This function adds the address of the sender to the 
    Whitelist
 */
function addAddressToWhitelist() public {
    // check if the user has already been whitelisted
    require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
    /** check if the numAddressesWhitelisted <
    maxWhitelistedAddresses, if not then throw an error. */
    require(numAddressesWhitelisted < maxWhitelistedAddresses,
    "More addresses cant be added, limit reached");
    // Add the address which called the to the whitelistedAddress array
    whitelistedAddresses[msg.sender] = true;
    // Increase the number of whitelisted addresses
    numAddressesWhitelisted += 1;

    /** maintain a mapping of addresses to booleans to indicate which address is part of the whitelist. 
    A user can add themsevles to the whitelist by calling addAddressesToWhitelist function before the maximum number of whitelisted addresses are hit. */
    }
}