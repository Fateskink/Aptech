const express = require('express')
const router = express.Router()

router.get('/', (req, res) => {
  res.json({
    result: 'get all students',
    message: "haha"
  })
})
router.get('/:id', (req, res) => {
    res.status(200).json({
        result: `get student infor from student's id = ${req.params.id} `
    })
})

router.patch('/:id', (req, res) => {
    res.send(`Update a student with id = ${req.params.id}`)
})

router.post('/', (req, res) => {
  res.send('Insert student')
})

module.exports = router