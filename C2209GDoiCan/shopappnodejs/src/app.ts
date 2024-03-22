// src/app.ts

import Koa from 'koa';
import Router from 'koa-router';
import bodyParser from 'koa-bodyparser';
import usersRouter from './routes/usersRouter';

//yarn add @types/koa @types/koa-router @types/koa-bodyparser

const app = new Koa();

// Sample data (replace with your actual data source)
let users: any[] = [];
// Middleware
app.use(bodyParser());

// Register routes
app.use(usersRouter.routes());
app.use(usersRouter.allowedMethods());


// Start the server
const PORT = process.env.PORT || 3099;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
