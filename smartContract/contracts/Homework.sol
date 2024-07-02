// Fiker Tewelde   Group 3
// Initial Gas Consumption = 21149219n
// Final Gas Consumption = 18366876n


pragma solidity ^0.8.0;

contract InefficientExample {
    uint256 public totalValue;              
    uint256 public itemCount;
    mapping(address => uint256) public balances;
    address[] public users;
     mapping(address => bool) public userSet;

    function calculateTotalValue() public returns (uint256) {
      //  totalValue = 0;
        for (uint256 i = 0; i < users.length; i++) {
            totalValue += balances[users[i]];
        }
        return totalValue;
    }


function addItem(uint256 value) public { //optimized this function to use mapping because the users.push(msg.sender) 
                                         // operation can become gas-intensive, as it involves modifying the dynamic array. 
   balances[msg.sender] += value;

  if (!userSet[msg.sender]) {
      userSet[msg.sender] = true;
    }
   
}                                                        
  bytes[] public items;

     //function addItemName(string memory itemName) public {
      //  items.push(itemName);
     //  }


    event ItemAdded(address indexed user, uint256 value, bytes itemName);
    
// removed function addItemWithEvent cause it is more or less the same as the function addItem 
 


struct Product {
    uint256 id;
    uint256 price;
    bytes name;
    bool available;
   
    
}
    Product[] public products;

    function addProduct(uint256 id, uint256 price, bytes memory name, bool available) public {
        products.push(Product(id, price, name, available));
    }
}