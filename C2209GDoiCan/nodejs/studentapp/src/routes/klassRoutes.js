const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
  //curl -i http://localhost:3001/classes
  debugger
  res.json({
    message: 'This is GET Klass'
  });
});
router.get('/:id', (req, res) => {
    //curl -i http://localhost:3001/classes
    debugger
    res.json({
      message: 'This is GET Klass'
    });
  });
  router.get('/:id/students', (req, res) => {
    //curl -i http://localhost:3001/classes
    debugger
    res.json({
      message: 'This is GET Klass'
    });
  });
router.post('/', (req, res) => {
    //curl -i http://localhost:3001/classes
    debugger
    res.json({
        message: 'This is post'
    });
});
router.post('/:id/classes/:id', (req, res) => {
    //curl -i http://localhost:3001/classes
    debugger
    res.json({
        message: 'This is post'
    });
});
router.put('/:id', (req, res) => {
    //curl -i http://localhost:3001/classes
    debugger
    res.json({
        message: 'This is PUT'
    });
});
router.delete('/', (req, res) => {
    //curl -i http://localhost:3001/classes
    debugger
    res.json({
        message: 'This is DELETE'
    });
});

module.exports = router;
