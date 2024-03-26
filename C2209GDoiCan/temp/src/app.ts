// src/app.ts

import Koa from 'koa';
import Router from 'koa-router';
import bodyParser from 'koa-bodyparser';
import usersRouter from './routes/usersRouter';

//yarn add @types/koa @types/koa-router @types/koa-bodyparser
//yarn add mongodb
//npm i -D @types/express @types/node ts-node ts-node-dev typescript
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
