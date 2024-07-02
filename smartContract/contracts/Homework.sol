//Rediet Negash Group 3
// Initial Gas Consumption = 21149219n
// Final Gas Consumption = 18451168n
pragma solidity ^0.8.0;

contract InefficientExample {
    uint256 public totalValue;
    uint256 public itemCount;
    mapping(address => uint256) public balances;
    address[] public users;
    mapping(address => bool) public userSet;

    function calculateTotalValue() public returns (uint256) {
        //totalValue = 0; It is not essential to set the value to 0 since it always starts from zero
        for (uint256 i = 0; i < users.length; i++) {
            totalValue += balances[users[i]];
        }
        return totalValue;
    }

    //Instead of storing the user address on the array it is more efficent to use mapping and to check whether the user exists before storing or mapping the user address
    function addItem(uint256 value) public {
        balances[msg.sender] += value;

        if (!userSet[msg.sender]) {
            userSet[msg.sender] = true;
        }
    }
    //use byte instead of string
    bytes[] public items;

    //function addItemName(string memory itemName) public {
    //  items.push(itemName);
    //  }

    event ItemAdded(address indexed user, uint256 value, bytes itemName);

    // This function is doing the same task as addItem function
    /* function addItemWithEvent(uint256 value, string memory itemName) public {
        balances[msg.sender] += value;
        users.push(msg.sender);
        items.push(itemName);
        itemCount++;
        emit ItemAdded(msg.sender, value, itemName);
    }
*/

    struct Product {
        uint256 id;
        uint256 price;
        bytes name;
        bool available;
    }
    Product[] public products;

    function addProduct(
        uint256 id,
        uint256 price,
        bytes memory name,
        bool available
    ) public {
        products.push(Product(id, price, name, available));
    }
}
