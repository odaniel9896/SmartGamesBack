const { Op } = require("sequelize");
const Game = require("../models/Game")
const Store = require("../models/Store")

module.exports = {
    //retorna todos os games
    async index(req, res) {

        try {
            const game = await Game.findAll({
              attributes: [
                "id",
                "name",
                "price",
                "description",
                "releaseDate",
                "developer",
                "platform",
                "image",
                "createdAt",
                "updatedAt",
              ],
              include: [
                {
                  association:"Stores",
                  attributes: ["id", "district", "street", "number", "cep", "complement"]
                },
                {
                  association: "Categories",
                  attributes: ["id", "description"],
                  through: {attributes: []}
                }
              ]
            });
            res.send(game);
        } catch (error) {
          console.log(error);
          res.status(500).send(error);
        }
    },
    async store(req, res) {
      //O Envio de jogo é feito no formato FORM-DATA, sendo convertido para JSON depois do envio
      const { name, price, description, releaseDate, developer, platform, stores, categories } = req.body;
      
      const categoriesArray = categories.split(",");

      const storesArray = categories.split(",")

      try {
        
          let store = await Store.findByPk(stores);
        if(!store)
           return res.status(404).send({error: "Loja não existe"})

        let game = await Game.create({
          name,
          price,
          description,
          releaseDate,
          developer,
          platform,
          image: req.file ? req.file.firebaseUrl: null
        });
  
         await game.addCategories(categoriesArray);
         await game.addStores(storesArray)
  
        //retorno sucesso
        res.status(201).send({
          id: game.id,
          name: game.title,
          description: game.description,
          releaseDate: game.releaseDate,
          developer: game.developer,
          platform: game.platform,
          image: req.file ? req.file.firebaseUrl : null
        });
      } catch (error) {
        console.log(error);
        res.status(500).send(error);
      }
    },
    //função para fazer a pesquisa do game por id
    async find (req,res) {
      const search = req.params.search;

      try {
        const game = await Game.findAll({
          where:{ 
                  [Op.or] : [ 
                      {
                          name : {
                              [Op.substring]: search
                          }
                      },            
                      { 
                          platform: {
                              [Op.substring]: search
                          }  
                      }
                  ,                 
                  ]
          },
          attributes: [
            "id",
            "name",
            "price",
            "description",
            "releaseDate",
            "developer",
            "platform",
            "image",
            "createdAt",
            "updatedAt",
          ],
          include: [
            {
              association:"Stores",
              attributes: ["id", "district", "street", "number", "cep"]
            },
            {
              association: "Categories",
              attributes: ["id", "description"],
              through: {attributes: []}
            }
          ]
        });
  
        //Se o jogo não for encontrado, retorna 404
        if (!game)
          return res.status(404).send({ erro: "Jogo não encontardo" });
  
        res.send(game);
      } catch (error) {
        console.log(error);
        res.status(500).send({ error });
      }
    }
}