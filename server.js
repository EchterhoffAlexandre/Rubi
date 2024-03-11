require("dotenv").config();
const express = require("express");

const router = require("./app/router");



const app = express();


app.use(express.json());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


const PORT = process.env.PORT ?? 3000;

app.listen(PORT, ()=>{
    console.log(`le serveur tourne sur le port : ${PORT}`)
})