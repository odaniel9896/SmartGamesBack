//Import de todos arquivos usados
const express = require("express");
const gameController = require("./controller/games");
const storeController = require("./controller/stores");
const UploadImage = require("./middleware/UploadImage");
const uploadFirebase = require("./services/uploadFirebase");
const uploadExcel = require("./middleware/uploadExcel");
const excelController = require("./controller/excel");
const orderController = require("./controller/order")



const routes = express.Router();

//rotas de games
routes.get("/games", gameController.index);
routes.get("/games/:id", gameController.find);
routes.post("/games", UploadImage, uploadFirebase, gameController.store);
routes.put("/games/:id", gameController.update);

//ROTAS DE EXCEL

routes.post("/excel", uploadExcel.single("file"), excelController.store);
routes.get("/excel", excelController.index);

//rotas da loja
routes.get("/stores", storeController.index);
routes.post("/stores", storeController.store);
routes.get("/stores/:id", storeController.find);

//rotas de pedidos

routes.post("/orders", orderController.store);

//export das routes
module.exports = routes;