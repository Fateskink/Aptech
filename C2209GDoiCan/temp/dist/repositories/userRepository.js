"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getUsers = void 0;
const db_1 = require("../db/db");
function getUsers() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const client = (0, db_1.getClient)();
            const db = client.db('shopapp');
            const collection = db.collection('users');
            const users = yield collection.find().toArray();
            return users;
        }
        catch (error) {
            console.error('Error fetching users:', error);
            return [];
        }
    });
}
exports.getUsers = getUsers;
exports.default = {
    getUsers
};
