pragma solidity ^0.4.24;
contract EcommerceStore{


    enum  ProductCondition {New,Used}
    uint public productIndex;

    mapping (address => mapping (uint => Product)) store;
    mapping (uint => address) productIdInStore;
    struct Product{
        uint id;
        string name;
        string category;
        string imageLink;
        uint descLink;
        uint startTime;
        uint price;
        ProductCondition condition;
        address buyer;

    }

    function Ecommercestrore() public {
         productIndex = 0;

    }



    function addProductToStore(string _name,string _category,string _imageLink
    ,uint _descLink, uint _startTime,uint _price,uint _condition) public {

        productIndex += 1;

Product memory product = Product(productIndex,_name, _category, _imageLink,_descLink,_startTime,_price,ProductCondition(_condition),0);

 store[msg.sender][productIndex] = product;
}

function getProduct(uint _id) public view

returns (uint,string,string,string,uint,uint,uint,ProductCondition,address)

{

 Product memory product = store[productIdInStore[_id]][_id];

    return (product.id,product.name,product.category,product.imageLink,product.descLink
    ,product.startTime,product.price,product.condition,product.buyer);
}

function buy(uint _productId)payable public {


 Product memory product = store[productIdInStore[_productId]][_productId];
 require(product.buyer == address(0));
 require(msg.value >= product.price);
 product.buyer = msg.sender;
 store[productIdInStore[_productId]][_productId] = product;

}


}
