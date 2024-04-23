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
 //console.log(MYSQL_PASSWORD);
app.use('/actors', actorRoute);
app.use('//movies', movieRoute);
app.listen(SERVER_PORT, () => {
    console.log(`Server is running on port ${SERVER_PORT}`);
});
