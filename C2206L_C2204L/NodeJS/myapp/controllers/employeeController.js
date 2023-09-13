//const Employee = require('../models/Employee');
const ffmpeg = require('fluent-ffmpeg');

// Lấy danh sách tất cả nhân viên
const getAllEmployees = (req, res) => {
  // Sử dụng Mongoose hoặc database driver khác để truy vấn danh sách nhân viên từ database
  res.json({
    sms: 'getAllEmployees day nhe'
  })
};
/*
function getAllEmployees(req, res) {

}
*/
// Lấy thông tin một nhân viên bằng ID
const getEmployeeById = (req, res) => {
  // Truy vấn một nhân viên bằng ID từ database và trả về kết quả
};

// Thêm một nhân viên mới
const createEmployee = (req, res) => {
  // Lấy dữ liệu từ req.body và thêm vào database
};

// Cập nhật thông tin một nhân viên bằng ID
const updateEmployee = (req, res) => {
  // Lấy dữ liệu từ req.body và cập nhật thông tin nhân viên trong database
};

// Xóa một nhân viên bằng ID
const deleteEmployee = (req, res) => {
  // Xóa một nhân viên bằng ID từ database
};

const streamVideo = (req, res) => {
    debugger
    const videoPath = require('path').resolve('./') + '/Video.mp4';
    debugger
    // Sử dụng ffmpeg để xử lý video và stream nó đến phản hồi (res)
    const ffmpegCommand = ffmpeg()
    .input(videoPath)
    .outputFormat('flv'); // Loại video được stream là MP4
    debugger
    // Bắt đầu quá trình stream video
    ffmpegCommand.on('end', () => {
        debugger
        console.log('Streaming ended');
    });
    
    // Pipe dữ liệu từ ffmpeg đến phản hồi (res)
    debugger
    ffmpegCommand.pipe(res, { end: true });
};

module.exports = {
  getAllEmployees,
  getEmployeeById,
  createEmployee,
  updateEmployee,
  deleteEmployee,
  streamVideo
};
