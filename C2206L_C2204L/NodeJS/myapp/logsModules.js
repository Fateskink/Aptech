const axios = require('axios');

// Hàm để gửi yêu cầu GET đến API
async function fetchEmployeeData() {
  try {
    const response = await axios.get('http://localhost:3001/api/employees');
    if (response.status === 200) {
      console.log('OK');
      console.log('Data:', response.data);
    } else {
      console.error('Yêu cầu không thành công');
      console.error('Status:', response.status);
      console.error('Data:', response.data);
    }
  } catch (error) {
    console.error('Lỗi khi gửi yêu cầu:', error.message);
  }
}

// Gọi hàm để gửi yêu cầu khi module được require
fetchEmployeeData();
