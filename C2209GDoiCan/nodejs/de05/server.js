/**
 yarn add cors dotenv express express-validator mysql2
 npm install --save-dev nodemon
 */
 const express = require('express');
 require('dotenv').config();
 const getConnection = require('./db/db')
 //const bodyParser = require('body-parser');
 const cors = require('cors')
 

 const {
	SERVER_PORT,
    DB_HOST,
    DB_PORT,
    MYSQL_USER,
    MYSQL_PASSWORD,
} = process.env;
 console.log(MYSQL_PASSWORD);