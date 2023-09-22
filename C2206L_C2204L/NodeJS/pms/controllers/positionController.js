const express = require('express');
const router = express.Router();
const connection = require('../db/db');

// Lấy danh sách tất cả vị trí công việc
router.get('/positions', (req, res) => {
  connection.query('SELECT * FROM POSITION', (err, results) => {
    if (err) {
      console.error('Lỗi truy vấn:', err);
      res.status(500).json({ error: 'Lỗi truy vấn cơ sở dữ liệu.' });
      return;
    }
    res.json(results);
  });
});

// Lấy thông tin một vị trí công việc bằng ID
router.get('/positions/:id', (req, res) => {
  const { id } = req.params;
  connection.query('SELECT * FROM POSITION WHERE PositionID = ?', [id], (err, results) => {
    if (err) {
      console.error('Lỗi truy vấn:', err);
      res.status(500).json({ error: 'Lỗi truy vấn cơ sở dữ liệu.' });
      return;
    }
    if (results.length === 0) {
      res.status(404).json({ error: 'Không tìm thấy vị trí công việc với ID này.' });
      return;
    }
    res.json(results[0]);
  });
});

module.exports = router;
