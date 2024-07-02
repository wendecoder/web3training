// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract VeryInefficientContract {
    uint256 public totalSum;
    uint256 public count;
    uint256[] public data;

    // This function uses view since it does not modify the state
    function getSum() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < data.length; i++) {
            sum += data[i];
        }
        return sum;
    }

    // This function changes state efficiently
    function addData(uint256[] memory newData) public {
        for (uint256 i = 0; i < newData.length; i++) {
            data.push(newData[i]);
        }
        count += newData.length;
    }

    // Inefficient storage of strings
    string public name;
    string[] public previousNames;

    function setName(string memory newName) public {
        name = newName; // Inefficient storage
        previousNames.push(newName); // Additional inefficient storage
    }

    // Poor usage of modifiers
    modifier checkCount(uint256 number) {
        require(number < count, "Number is too large");
        _;
    }

    function getData(uint256 index) public view checkCount(index) returns (uint256) {
        return data[index];
    }

    // Efficient packing of variables
    struct User {
        uint256 id;
        uint256 balance;
        bool active;
    }

    User[] public users;

    function addUser(uint256 id, uint256 balance, bool active) public {
        users.push(User(id, balance, active));
    }
}
