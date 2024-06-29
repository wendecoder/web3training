pragma solidity ^0.8.0;

contract VeryInefficientContract {
    uint256 public totalSum;
    uint256 public count;
    uint256[] public data;

    // This function does not use view or pure when it could
    function getSum() public returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < data.length; i++) {
            sum += data[i];
            totalSum += data[i]; // Unnecessary state change within the loop
        }
        totalSum = sum; // Unnecessary state change
        return sum;
    }

    // This function changes state unnecessarily within a loop
    function addData(uint256[] memory newData) public {
        for (uint256 i = 0; i < newData.length; i++) {
            data.push(newData[i]);
            count++; // Unnecessary state change within a loop
        }
        count += newData.length; // Another unnecessary state change
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

    function getData(uint256 index) public checkCount(index) returns (uint256) {
        return data[index];
    }

    // Inefficient packing of variables
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
