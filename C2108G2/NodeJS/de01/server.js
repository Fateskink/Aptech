const express = require('express');
const app = express();

const studentRoutes = require('./routes/studentRoute.js');
debugger
app.use(express.json());
app.use('/students', studentRoutes);

// Your remaining app logic here...

app.listen(3000, () => console.log('Server started on port 3000'));
