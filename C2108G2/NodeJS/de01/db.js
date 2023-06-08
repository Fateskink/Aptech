const mysql = require('mysql')
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'studentManagements',    
    port: 3309,
  });
  connection.connect(function(err) {
    if (err) throw err;
    console.log("Connected!!!")
  });
  
  debugger
  module.exports = connection
