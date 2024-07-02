pragma solidity ^0.8.0;

contract EfficientExample {
    uint256 public totalValue;
    uint256 public itemCount;
    mapping(address => uint256) public balances;
    mapping(address => bool) public registeredUsers;
    string[] public items;

    struct Product {
        uint256 id;
        uint256 price;
        string name;
        bool available;
    }

    Product[] public products;

    event ItemAdded(address indexed user, uint256 value, string itemName);

    function calculateTotalValue() public view returns (uint256) {
        return totalValue;
    }

    function addItem(uint256 value) public {
        if (!registeredUsers[msg.sender]) {
            registeredUsers[msg.sender] = true;
            itemCount++;
        }
        balances[msg.sender] += value;
        totalValue += value;
    }

    function addItemName(string memory itemName) public {
        items.push(itemName);
    }

    function addItemWithEvent(uint256 value, string memory itemName) public {
        addItem(value);
        addItemName(itemName);
        emit ItemAdded(msg.sender, value, itemName);
    }

    function addProduct(uint256 id, uint256 price, string memory name, bool available) public {
        products.push(Product(id, price, name, available));
    }
}
