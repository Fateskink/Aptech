"use strict";
// usersRoutes.ts
Object.defineProperty(exports, "__esModule", { value: true });
var koa_router_1 = require("koa-router");
var usersController_1 = require("../controllers/usersController");
var router = new koa_router_1.default();
router.get('/users', usersController_1.getUsers);
router.post('/users', usersController_1.createUser);
exports.default = router;
