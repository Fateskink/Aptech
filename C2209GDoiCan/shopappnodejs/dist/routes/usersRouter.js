"use strict";
// usersRoutes.ts
Object.defineProperty(exports, "__esModule", { value: true });
const Router = require('koa-router');
const usersController_1 = require("../controllers/usersController");
const router = new Router();
router.get('/users', usersController_1.getUsers);
router.post('/users', usersController_1.createUser);
module.exports = router;
//# sourceMappingURL=usersRouter.js.map