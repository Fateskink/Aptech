//npm = Node Package Manager
//nodemon = node monitor

//const sum = require("./calculation").sum //not Good !
//const PI = require("./calculation").PI //not Good !
//distructuring is better
const {sum, PI, multiply} = require("./calculation") //why const ? ref to a function is "const"
console.log("Chao cac ban haha")
console.log('3 plus 2 = '+sum(3, 2))
console.log('PI = '+PI)
console.log(`multiply 3 and 4 is: ${multiply(3, 4)}`)