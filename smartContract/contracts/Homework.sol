pragma solidity ^0.8.0;

contract InefficientExample {
    uint256 public totalValue;
    uint256 public itemCount;
    mapping(address => uint256) public balances;
    address[] public users;

    function calculateTotalValue() public view returns (uint256) {
        uint256 totalValue = 0;
        for (uint256 i = 0; i < users.length; i++) {
            totalValue += balances[users[i]];
        }
        return totalValue;
    }
    


    function addItem(uint256 value) public {
        balances[msg.sender] += value;
        // users.push(msg.sender);
        // itemCount++; 
    }
    

    string[] public items;

    function addItemName(string memory itemName) public {
        items.push(itemName);
    }

    event ItemAdded(address indexed user, uint256 value, string itemName);

    function addItemWithEvent(uint256 value, string memory itemName) public {
        balances[msg.sender] += value;
        // users.push(msg.sender);
        // items.push(itemName);
        // itemCount++;
        emit ItemAdded(msg.sender, value, itemName);
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
