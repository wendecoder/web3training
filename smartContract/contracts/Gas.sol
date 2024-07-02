pragma solidity ^0.8.0;

contract VeryEfficientContract {
    uint256 public totalSum;
    uint256 public count;
    uint256[] public data;


    function getSum() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < data.length; i++) {
            sum += data[i];
        }
        return sum;
    }

    function addData(uint256[] memory newData) public {
        for (uint256 i = 0; i < newData.length; i++) {
            data.push(newData[i]);
        }
        count += newData.length;
    }

    string public name;
    string[] public previousNames;

    function setName(string memory newName) public {
        name = newName;
        previousNames.push(newName);
    }

    modifier validIndex(uint256 index) {
        require(index < data.length, "Index out of bounds");
        _;
    }

    function getData(uint256 index) public view validIndex(index) returns (uint256) {
        return data[index];
    }

    struct User {
        uint256 id;
        bool active;
        uint256 balance;
    }

    User[] public users;

    function addUser(uint256 id, uint256 balance, bool active) public {
        users.push(User(id, active, balance));
    }
}
