const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  //curl -i http://localhost:3001/students
  debugger
  res.json({
    message: 'Chao ban, day la danh sach product'
  });
});
router.post('/', (req, res) => {
    //curl -i http://localhost:3001/students
    debugger
    res.json({
        message: 'This is post'
    });
});
router.put('/', (req, res) => {
    //curl -i http://localhost:3001/students
    debugger
    res.json({
        message: 'This is PUT'
    });
});
router.delete('/', (req, res) => {
    //curl -i http://localhost:3001/students
    debugger
    res.json({
        message: 'This is DELETE'
    });
});

module.exports = router;
