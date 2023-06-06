const express = require('express');
debugger
const router = express.Router();

const studentController = require('../controllers/studentController');

// C - Create
router.post('/', studentController.createStudent);

// R - Read
router.get('/', studentController.getAllStudents);
router.get('/:id', studentController.getStudentById);

// U - Update
router.put('/:id', studentController.updateStudent);

// D - Delete
router.delete('/:id', studentController.deleteStudent);

module.exports = router;
