/*
import {substract, sum} from './src/utilities/calculation.js';
console.log(`5 - 2 = ${substract(5,2)}`)
console.log(`5 + 2 = ${sum(5,2)}`)
debugger
*/
//npm install --save express mongoose express-validator dotenv
//npm install --save-dev nodemon
const express = require('express');
const bodyParser = require('body-parser');
const studentRoutes = require('./src/routes/studentRoutes');
const klassRoutes = require('./src/routes/klassRoutes');
require('dotenv').config();
const app = express();

const { PORT } = process.env;


app.use(bodyParser.json());

// Routes for each entity
app.use('/students', studentRoutes);
app.use('/classes', klassRoutes);

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});