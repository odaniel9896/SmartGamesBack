//importa o express
const express = require("express");
const cors = require("cors");


//importa as rotas
const routes = require("./routes");

require("./database");

//cria a aplicação express
const app = express();

app.use(express.json());

app.use(cors())


//definimos a pasta uploads como pública, servindo arquivos estáticos

app.use(routes);


module.exports = app;
