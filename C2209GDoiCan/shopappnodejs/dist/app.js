"use strict";
// src/app.ts
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const koa_1 = __importDefault(require("koa"));
const koa_router_1 = __importDefault(require("koa-router"));
const koa_bodyparser_1 = __importDefault(require("koa-bodyparser"));
//yarn add @types/koa @types/koa-router @types/koa-bodyparser
const app = new koa_1.default();
const router = new koa_router_1.default();
// Sample data (replace with your actual data source)
let users = [];
// Middleware
app.use((0, koa_bodyparser_1.default)());
// Routes
router.get('/users', (ctx) => __awaiter(void 0, void 0, void 0, function* () {
    ctx.body = users;
}));
router.post('/users', (ctx) => __awaiter(void 0, void 0, void 0, function* () {
    const newUser = ctx.request.body;
    users.push(newUser);
    ctx.status = 201;
    ctx.body = newUser;
}));
// Register routes
app.use(router.routes());
app.use(router.allowedMethods());
// Start the server
const PORT = process.env.PORT || 3099;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
