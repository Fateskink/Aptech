const express = require('express');
const router = express.Router();
const connection = require('../db/db');

// Lấy danh sách tất cả tổ chức
router.get('/organizations', (req, res) => {
  connection.query('SELECT * FROM ORGANIZATION', (err, results) => {
    if (err) {
      console.error('Lỗi truy vấn:', err);
      res.status(500).json({ error: 'Lỗi truy vấn cơ sở dữ liệu.' });
      return;
    }
    res.json(results);
  });
});

// Lấy thông tin một tổ chức bằng ID
router.get('/organizations/:id', (req, res) => {
  const { id } = req.params;
  connection.query('SELECT * FROM ORGANIZATION WHERE OrganizationID = ?', [id], (err, results) => {
    if (err) {
      console.error('Lỗi truy vấn:', err);
      res.status(500).json({ error: 'Lỗi truy vấn cơ sở dữ liệu.' });
      return;
    }
    if (results.length === 0) {
      res.status(404).json({ error: 'Không tìm thấy tổ chức với ID này.' });
      return;
    }
    res.json(results[0]);
  });
});

// Thêm một tổ chức mới
router.post('/organizations', (req, res) => {
  const organizationData = req.body;
  connection.query('INSERT INTO ORGANIZATION SET ?', [organizationData], (err, results) => {
    if (err) {
      console.error('Lỗi truy vấn:', err);
      res.status(500).json({ error: 'Lỗi truy vấn cơ sở dữ liệu.' });
      return;
    }
    res.status(201).json({ message: 'Thêm tổ chức thành công.' });
  });
});

// Cập nhật thông tin một tổ chức bằng ID
router.put('/organizations/:id', (req, res) => {
  const { id } = req.params;
  const organizationData = req.body;
  connection.query('UPDATE ORGANIZATION SET ? WHERE OrganizationID = ?', [organizationData, id], (err, results) => {
    if (err) {
      console.error('Lỗi truy vấn:', err);
      res.status(500).json({ error: 'Lỗi truy vấn cơ sở dữ liệu.' });
      return;
    }
    res.json({ message: 'Cập nhật thông tin tổ chức thành công.' });
  });
});

// Xóa một tổ chức bằng ID
router.delete('/organizations/:id', (req, res) => {
  const { id } = req.params;
  connection.query('DELETE FROM ORGANIZATION WHERE OrganizationID = ?', [id], (err, results) => {
    if (err) {
      console.error('Lỗi truy vấn:', err);
      res.status(500).json({ error: 'Lỗi truy vấn cơ sở dữ liệu.' });
      return;
    }
    res.json({ message: 'Xóa tổ chức thành công.' });
  });
});

module.exports = router;
