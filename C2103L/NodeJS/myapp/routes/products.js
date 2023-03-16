const express = require('express');
const Product = require('../models/Product');
const router = express.Router();

router.get('/', function(req, res) {
    //res.send('Get all products');
    let page = parseInt(req.query?.page ?? 0)
    let limit = parseInt(req.query?.limit ?? 0)
    // let products = [
    //     new Product({name: 'n1', price: 11, description: 'd11'}),
    //     new Product({name: 'n2', price: 22, description: 'd22'}),
    //     new Product({name: 'n3', price: 33, description: 'd33'}),
    //     new Product({name: 'n4', price: 44, description: 'd44'}),
    // ]
    res.status(200).json({
        messsage: 'Get products list sucessfully',
        data: {}
    })
});

router.get('/:id', function(req, res) {
    const productId = req.params.id;
    res.send(`Get product with ID ${productId}`);
});

router.post('/', function(req, res) {    
    const {name, price, description} = req //destructuring
    debugger    
    res.send('Create a new product');
});

router.put('/:id', function(req, res) {
    const productId = req.params.id;
    res.send(`Update product with ID ${productId}`);
});

router.delete('/:id', function(req, res) {
    const productId = req.params.id;
    res.send(`Delete product with ID ${productId}`);
});

module.exports = router;