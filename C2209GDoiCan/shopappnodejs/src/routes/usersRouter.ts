// usersRoutes.ts

const Router = require('koa-router');
import { getUsers, createUser } from '../controllers/usersController';

const router = new Router();

router.get('/users', getUsers);
router.post('/users', createUser);

module.exports = router;
