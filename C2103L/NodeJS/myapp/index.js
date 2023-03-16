const express = require('express');
const app = express();
require('dotenv').config();
const {
    sum, 
    multiply
} = require('./calculations')
const Product = require('./models/Product')
const Log = require('./Log')

console.log("Heelo, how are you? ")
/*
for(let i = 0; i < 10; i++) {
    console.log(`Gia tri cua i = ${i}`)
}
*/
console.log(`sum 2 and 3 is : ${sum(2, 3)}`)
console.log(`multiply 2 and 3 is : ${multiply(2, 3)}`)
const productA = new Product({
    price: 800, 
    name: "iphone 14",     
    description: "This is for test"
})
debugger
productA.price = 123 //ok
//productA = new Product({name: "", price: 0, description: ''}) //failed if productA is const
console.log('haha')

const usersRouter = require('./routes/users');
const productsRouter = require('./routes/products');

app.use('/users', usersRouter);
app.use('/products', productsRouter);
Log.warn('This is an errro')
app.listen(process.env.PORT, function() {
    console.log(`Server listening on port ${process.env.PORT}`);
});
