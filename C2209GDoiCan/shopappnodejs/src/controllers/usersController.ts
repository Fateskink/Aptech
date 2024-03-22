// usersController.ts

import { Context } from 'koa';



export async function getUsers(ctx: Context) {
  
}

export async function createUser(ctx: Context) {
  const newUser = ctx.request.body;
  
  ctx.status = 201;
  ctx.body = newUser;
}
