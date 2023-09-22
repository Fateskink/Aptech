const express = require('express');
const router = express.Router();
const connection = require('../db/db');

// Lấy danh sách tất cả giới tính
router.get('/sexes', (req, res) => {
  connection.query('SELECT * FROM SEX', (err, results) => {
    if (err) {
      console.error('Lỗi truy vấn:', err);
      res.status(500).json({ error: 'Lỗi truy vấn cơ sở dữ liệu.' });
      return;
    }
    res.json(results);
  });
});

// Lấy thông tin một giới tính bằng ID
router.get('/sexes/:id', (req, res) => {
  const { id } = req.params;
  connection.query('SELECT * FROM SEX WHERE SexID = ?', [id], (err, results) => {
    if (err) {
      console.error('Lỗi truy vấn:', err);
      res.status(500).json({ error: 'Lỗi truy vấn cơ sở dữ liệu.' });
      return;
    }
    if (results.length === 0) {
      res.status(404).json({ error: 'Không tìm thấy giới tính với ID này.' });
      return;
    }
    res.json(results[0]);
  });
});

module.exports = router;
