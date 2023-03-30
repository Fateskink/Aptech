const express = require('express')
const router = express.Router()
const {
  getEmployees,
  insertEmployee
} = require('../controllers/employee.js')

router.get('/', async (req, res) => {
  debugger  
  getEmployees((err, result) => {
    debugger
    if (err) throw err
    res.json(result)  
  })
})
router.get('/:id', async (req, res) => {
  const id = req.params?.id ?? ''  
})

router.post('/', async (req, res) => {  
  debugger  
  insertEmployee(req.body, (err, result) => {
    debugger
    if (err) throw err
    res.json(result)  
  })      
})
router.put('/:id', async (req, res) => {
  const {id} = req.params
  const {Name,Age,Address, Salary} = req.body

})
router.delete('/:id', async (req, res) => {
  const {name, age, address, javaScore,csharpScore} = req.body  
})
module.exports = router