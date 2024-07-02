// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract OptimizedExample {
    uint256 public totalValue;
    uint256 public itemCount;
    mapping(address => uint256) public balances;

    // Removed the users array to save gas
    // address[] public users; 

    // Keeping totalValue updated directly within addItem and addItemWithEvent
    function calculateTotalValue() public view returns (uint256) { // Changed to view to save gas
        return totalValue;
    }

    function addItem(uint256 value) public {
        balances[msg.sender] += value;
        totalValue += value; // Update totalValue directly
        // users.push(msg.sender); // Removed to save gas
        itemCount++;
    }

    // Use mapping to store item names to avoid dynamic array resizing
    mapping(uint256 => string) public items;

    function addItemName(uint256 itemId, string memory itemName) public {
        items[itemId] = itemName;
    }

    event ItemAdded(address indexed user, uint256 value, uint256 itemId, string itemName);

    function addItemWithEvent(uint256 value, uint256 itemId, string memory itemName) public {
        balances[msg.sender] += value;
        totalValue += value; // Update totalValue directly
        // users.push(msg.sender); // Removed to save gas
        items[itemId] = itemName;
        itemCount++;
        emit ItemAdded(msg.sender, value, itemId, itemName);
    }

    struct Product {
        uint256 id;
        uint256 price;
        string name;
        bool available;
    }

    Product[] public products;

    function addProduct(uint256 id, uint256 price, string memory name, bool available) public {
        products.push(Product(id, price, name, available));
    }
}
