const express = require('express');
const router = express.Router();

router.get('/', function(req, res) {
    res.send('Get all products');
});

router.get('/:id', function(req, res) {
    const productId = req.params.id;
    res.send(`Get product with ID ${productId}`);
});

router.post('/', function(req, res) {
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