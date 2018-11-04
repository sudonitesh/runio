var ecommerce_store_artifacts = require('./build/contracts/EcommerceStore.json')
var contract = require('truffle-contract')
var Web3 = require('web3')
var provider = new Web3.providers.HttpProvider("http://localhost:8545");
var EcommerceStore = contract(ecommerce_store_artifacts);
EcommerceStore.setProvider(provider);

var mongoose = require('mongoose');
mongoose.Promise = global.Promise;
var ProductModel = require('./product');
mongoose.connect("mongodb://root:Abc1234@ds117209.mlab.com:17209/w-manage");
var db = mongoose.connection;
db.on('error', console.error.bind(console, 'MongoDB connection error:'));

var express = require('express');

var app = express();

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

app.listen(3004, function() {
  console.log("Ebay on Ethereum server listening on port 3004");
});

app.get('/', function(req, res) {
  res.send("Hello, Ethereum!");
});
