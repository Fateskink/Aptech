const express = require('express')
const app = express()
const port = 3002
//routes
const {
    studentsRouter, 
    usersRouter    
} = require('./routes')

app.use('/students', studentsRouter)
app.use('/users', usersRouter)

app.get('/', (req, res) => {
    console.log(req.params)
    res.send('Root router, test only')
})


app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})