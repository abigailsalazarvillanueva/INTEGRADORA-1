const cors= require('cors');

const express = require ('express')
const mysql = require ('mysql')
const bodyParser = require ('body-parser')


const app = express ()


app.use (cors());


app.use (function(req,res,next){
    res.setHeader('Access-control-Allow-Origin', '*')
    res.setHeader('Access-control-Allow-Methods', '*')
    next()
})

app.use(bodyParser.json())

const Puerto = 3000

const conexion = mysql.createConnection(
    {
        host: 'localhost',
        database: 'estacionamiento',
        user: 'root2',
        password: ''
    }
)

app.listen(Puerto, () =>{
    console.log(` servidor corriendo en el puerto ${Puerto}` )

})

conexion.connect( error => {
    if (error) throw error
console.log('Conexion exitosa a la BD')
})

app.get('/', (req, res) => {
    res.send('API')
})

