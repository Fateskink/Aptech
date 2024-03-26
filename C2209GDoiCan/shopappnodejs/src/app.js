"use strict";
// src/app.ts
Object.defineProperty(exports, "__esModule", { value: true });
var koa_1 = require("koa");
var koa_bodyparser_1 = require("koa-bodyparser");
var usersRouter_1 = require("./routes/usersRouter");
//yarn add @types/koa @types/koa-router @types/koa-bodyparser mongodb
var app = new koa_1.default();
// Middleware
app.use((0, koa_bodyparser_1.default)());
// Register routes
app.use(usersRouter_1.default.routes());
app.use(usersRouter_1.default.allowedMethods());
// Start the server
//http://localhost:3099/users
var PORT = process.env.PORT || 3003;
app.listen(PORT, function () {
    console.log("Server is running on port ".concat(PORT));
});
