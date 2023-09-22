const express = require('express');
const employeeRoutes = require('./routes/employeeRoutes');
const userRoutes = require('./routes/userRoutes');
const sexRoutes = require('./routes/sexRoutes');
const organizationRoutes = require('./routes/organizationRoutes');
const positionRoutes = require('./routes/positionRoutes');


const app = express();
const port = 3001;

app.use(express.json());

// Sử dụng tuyến đường cho thực thể "employees"
app.use('/api/employees', employeeRoutes);
app.use('/api/users', userRoutes);
app.use('/api/organizations', organizationRoutes);
app.use('/api/sex', sexRoutes);
app.use('/api/positions', positionRoutes);


app.listen(port, () => {
  console.log(`Server đang lắng nghe tại cổng ${port}`);
});
