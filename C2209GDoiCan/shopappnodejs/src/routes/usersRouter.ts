// usersRoutes.ts

import Router from 'koa-router';
import { getUsers, createUser } from '../controllers/usersController';

const router = new Router();

router.get('/users', getUsers);
router.post('/users', createUser);

export default router;
