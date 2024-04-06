const express = require('express');
const router = express.Router();
const { validationResult } = require('express-validator');
const {emailValidation, nameValidation} = require('../validations/inputValidations');

router.get('/', (req, res) => {
  //curl -i http://localhost:3001/students
  debugger
  res.json({
    message: 'Chao ban, day la danh sach student'
  });
});
router.get('/:id', (req, res) => {
    //curl -i http://localhost:3001/students
    debugger
    res.json({
      message: 'Chao ban, day la danh sach student'
    });
  });
  router.get('/:id/classes', (req, res) => {
    //curl -i http://localhost:3001/students
    debugger
    res.json({
      message: 'Chao ban, day la danh sach student'
    });
  });


/**
curl -i -X POST http://localhost:3001/students \
  -H "Content-Type: application/json" \
  -d '{"name": "John Doe", "age": 20, "phone_number": "11223344", "code": "C1245", "email": "hdhd"}'

*/  
  router.post('/', 
    emailValidation,   
    nameValidation,      
    (req, res) => {
      debugger            
      const result = validationResult(req);
      if (result.isEmpty()) {        
        res.json({
          message: 'This is post'
        });
      }    
      res.send({ errors: result.array() });            
      
});
router.put('/:id', (req, res) => {
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
