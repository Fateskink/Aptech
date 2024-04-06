const express = require('express');
const router = express.Router();
const klassController = require('../controllers/klassController');

router.get('/', klassController.getKlasses);
router.get('/:id', klassController.getKlassById);

router.get('/:id/students', (req, res) => {
    //curl -i http://localhost:3001/classes
  debugger
  res.json({
    message: 'This is GET Klass'
  });
});
router.post('/klasses', klassController.createKlass); 
router.put('/klasses/:id', klassController.updateKlass); 

router.post('/:id/classes/:id', (req, res) => {
    //curl -i http://localhost:3001/classes
    debugger
    res.json({
        message: 'This is post'
    });
});

router.delete('/', klassController.deleteKlass);

module.exports = router;
