// usersRoutes.ts

const Router = require('koa-router');
//import { getUsers, createUser } from '../controllers/usersController';
const { getUsers, createUser } = require('../controllers/usersController');//destructuring
const router = new Router();

router.get('/users', getUsers);
router.post('/users', createUser);

module.exports = router;
