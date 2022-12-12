const express = require('express')
const router = express.Router()

//POST localhost:3002/users/login
router.post('/login', (req, res) => {
  res.send('Post login')
})

router.post('/register', (req, res) => {
  res.send('post register')
})

module.exports = router