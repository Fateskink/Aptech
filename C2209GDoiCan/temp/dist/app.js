"use strict";
// src/app.ts
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const koa_1 = __importDefault(require("koa"));
const koa_bodyparser_1 = __importDefault(require("koa-bodyparser"));
const usersRouter_1 = __importDefault(require("./routes/usersRouter"));
//yarn add @types/koa @types/koa-router @types/koa-bodyparser
//yarn add mongodb
const app = new koa_1.default();
// Middleware
app.use((0, koa_bodyparser_1.default)());
// Register routes
app.use(usersRouter_1.default.routes());
app.use(usersRouter_1.default.allowedMethods());
// Start the server
//http://localhost:3099/users
const PORT = process.env.PORT || 3003;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
