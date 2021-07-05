const express = require('express')
const bodyParser = require('body-parser')
//Init app object from express function
const app = express()
app.use(express.urlencoded({extended: true}))
app.use(express.json())
const PORT = 3001
//import routers
const userRouter = require('./routers/user')

//simple GET request
app.get('/', (request, response) => {
   response.send('Hello from Server') 
})
//config middleware routers
app.use('/users', userRouter)


app.listen(PORT, () => {
    console.log(`Server is listening from port : ${PORT}`)
})
//1 entity => 1 route
