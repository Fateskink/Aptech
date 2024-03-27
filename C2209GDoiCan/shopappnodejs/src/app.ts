// src/app.ts

const Koa = require('koa');
const bodyParser = require('koa-bodyparser');
const usersRouter = require('./routes/usersRouter');

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
//http://localhost:3099/users
const PORT = process.env.PORT || 3003;
app.listen(PORT, () => {  
  console.log(`Server is running on port ${PORT}`);
});
