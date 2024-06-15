import express from 'express'
import cors from 'cors'

import db from './database/db.js'
import clientRouters from './routes/routes.js'
import usuarioRouters from './routes/userRouter.js'

const app = express()


app.use( cors() )
app.use(express.json())

//Clientes
app.use('/clientes',clientRouters)

//Usuario
app.use('/login',usuarioRouters)

//Home
app.get('/', (req, res) =>{
    res.send('HOLA MUNDO')
})

//Validacion a BD
try {
    await db.authenticate()
    console.log('Conexion exitosa a la DB')
} catch (error) {
    console.log(`El error conexion es: ${error}`)
}


// Start server
const PORT = 8000
app.listen(PORT,()=>{
    console.log('Server UP running in http://localhost:8000')

})
