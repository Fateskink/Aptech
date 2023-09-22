const express = require('express');
const router = express.Router();
const connection = require('../db/db');

// Lấy danh sách tất cả người dùng
router.get('/users', (req, res) => {
  connection.query('SELECT * FROM USERS', (err, results) => {
    if (err) {
      console.error('Lỗi truy vấn:', err);
      res.status(500).json({ error: 'Lỗi truy vấn cơ sở dữ liệu.' });
      return;
    }
    res.json(results);
  });
});

// Lấy thông tin một người dùng bằng ID
router.get('/users/:id', (req, res) => {
  const { id } = req.params;
  connection.query('SELECT * FROM USERS WHERE UsersID = ?', [id], (err, results) => {
    if (err) {
      console.error('Lỗi truy vấn:', err);
      res.status(500).json({ error: 'Lỗi truy vấn cơ sở dữ liệu.' });
      return;
    }
    if (results.length === 0) {
      res.status(404).json({ error: 'Không tìm thấy người dùng với ID này.' });
      return;
    }
    res.json(results[0]);
  });
});
// Kiểm tra đăng nhập
router.get('/checkLogin', (req, res) => {
  const { UserName, Password } = req.body;
  connection.query('SELECT * FROM USERS WHERE UserName = ? AND Password = ?', [UserName, Password], (err, results) => {
    if (err) {
      console.error('Lỗi truy vấn:', err);
      res.status(500).json({ error: 'Lỗi truy vấn cơ sở dữ liệu.' });
      return;
    }
    if (results.length === 0) {
      res.status(401).json({ error: 'Sai tên đăng nhập hoặc mật khẩu.' });
      return;
    }
    const user = results[0];
    res.json({ message: 'Đăng nhập thành công', user });
  });
});

// Thêm một người dùng mới
router.post('/users', (req, res) => {
  const userData = req.body;
  connection.query('INSERT INTO USERS SET ?', [userData], (err, results) => {
    if (err) {
      console.error('Lỗi truy vấn:', err);
      res.status(500).json({ error: 'Lỗi truy vấn cơ sở dữ liệu.' });
      return;
    }
    res.status(201).json({ message: 'Thêm người dùng thành công.' });
  });
});

// Cập nhật thông tin một người dùng bằng ID
router.put('/users/:id', (req, res) => {
  const { id } = req.params;
  const userData = req.body;
  connection.query('UPDATE USERS SET ? WHERE UsersID = ?', [userData, id], (err, results) => {
    if (err) {
      console.error('Lỗi truy vấn:', err);
      res.status(500).json({ error: 'Lỗi truy vấn cơ sở dữ liệu.' });
      return;
    }
    res.json({ message: 'Cập nhật thông tin người dùng thành công.' });
  });
});

// Xóa một người dùng bằng ID
router.delete('/users/:id', (req, res) => {
  const { id } = req.params;
  connection.query('DELETE FROM USERS WHERE UsersID = ?', [id], (err, results) => {
    if (err) {
      console.error('Lỗi truy vấn:', err);
      res.status(500).json({ error: 'Lỗi truy vấn cơ sở dữ liệu.' });
      return;
    }
    res.json({ message: 'Xóa người dùng thành công.' });
  });
});

module.exports = router;
