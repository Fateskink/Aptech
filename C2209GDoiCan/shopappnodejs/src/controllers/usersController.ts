// usersController.ts

import { Context } from 'koa';
import userRepository  from '../repositories/userRepository';


export async function getUsers(ctx: Context) {
  debugger
  ctx.body = await userRepository.getUsers(); 
}

export async function createUser(ctx: Context) {
  const newUser = ctx.request.body;
  
  ctx.status = 201;
  ctx.body = newUser;
}
