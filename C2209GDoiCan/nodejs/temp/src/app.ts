// src/app.ts

const Koa = require('koa');
const bodyParser = require('koa-bodyparser');
const usersRouter = require('./routes/usersRouter');
const {substract, sum} = require('../src/utilities/calculation');
console.log(`5 + 2 = ${sum(5,2)}`);
console.log(`5 - 2 = ${substract(5,2)}`);
//const {sum, substract} = require('../src/utilities/calculation');

//yarn add @types/koa @types/koa-router @types/koa-bodyparser mongodb
//yarn add koa-bodyparser koa koa-router
//yarn add mongodb
//npm install typescript @types/node nodemon --save-dev

//how to debug: https://www.youtube.com/watch?v=f3i9b3uK00U
//npm install ts-node tsconfig-paths --save-dev
const app = new Koa();
// Middleware
app.use(bodyParser());
// Register routes
app.use(usersRouter.routes());
app.use(usersRouter.allowedMethods());


// Start the server
//http://localhost:3003/users
const PORT = process.env.PORT || 3003;
app.listen(PORT, () => {  
  console.log(`Server is running on port ${PORT}`);
});
