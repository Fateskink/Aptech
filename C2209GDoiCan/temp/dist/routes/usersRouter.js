"use strict";
// usersRoutes.ts
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const koa_router_1 = __importDefault(require("koa-router"));
const usersController_1 = require("../controllers/usersController");
const router = new koa_router_1.default();
router.get('/users', usersController_1.getUsers);
router.post('/users', usersController_1.createUser);
exports.default = router;
