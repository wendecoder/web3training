/*
name :   Melat Mesele
telegram : @Melat1993
email :  melat1993m@gmail.com
 */
pragma solidity ^0.8.0;

contract EfficientExample {
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
    

    bytes32[] public items;

    function addItemName(bytes32 itemName) public {
        items.push(itemName);
    }

    event ItemAdded(address indexed user, uint256 value, bytes32 itemName);

    function addItemWithEvent(uint256 value, bytes32 itemName) public {
        balances[msg.sender] += value;
        // users.push(msg.sender);
        // items.push(itemName);
        // itemCount++;
        emit ItemAdded(msg.sender, value, itemName);
    }

    struct Product {
        uint256 id;
        uint256 price;
        bytes32 name;
        bool available;
    }

    Product[] public products;

    function addProduct(uint256 id, uint256 price, bytes32 name, bool available) public {
        products.push(Product(id, price, name, available));
    }
}
