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
          "image",
          "createdAt",
          "discount",
          "updatedAt",
        ],
        include: [
          {
            association: "Stores",
            attributes: ["id", "district", "street", "number", "cep", "complement"]
          },
          {
            association: "Categories",
            attributes: ["id", "description"],
            through: { attributes: [] }
          },
          {
            association: "Platforms",
            attributes: ["id", "name"],
            through: { attributes: [] }
          }
        ]
      });
      res.status(200).send(game);
    } catch (error) {
      console.log(error);
      res.status(500).send(error);
    }
  },
  async store(req, res) {
    //O Envio de jogo é feito no formato FORM-DATA, sendo convertido para JSON depois do envio
    const { name, price, description, releaseDate, developer, platform, stores, categories } = req.body;

    const categoriesArray = categories.split(",");

    const storesArray = stores.split(",");

    const platformArray = platform.split(",");

    try {

      let store = await Store.findByPk(stores);
      if (!store)
        return res.status(404).send({ error: "Loja não existe" })

      let game = await Game.create({
        name,
        price,
        description,
        releaseDate,
        developer,
        image: req.file ? req.file.firebaseUrl : null
      });

      await game.addCategories(categoriesArray);
      await game.addStores(storesArray);

      await game.addPlataforms(platformArray)

      //retorno sucesso
      res.status(201).send({
        id: game.id,
        name: game.title,
        description: game.description,
        releaseDate: game.releaseDate,
        developer: game.developer,
        image: req.file ? req.file.firebaseUrl : null
      });
    } catch (error) {
      console.log(error);
      res.status(500).send(error);
    }
  },
  //função para fazer a pesquisa do game por id
  async find(req, res) {
    const id = req.params.id;

    try {
      const game = await Game.findByPk(id, {
        attributes: [
          "id",
          "name",
          "price",
          "description",
          "releaseDate",
          "developer",
          "image",
          "discount",
          "createdAt",
          "updatedAt",
        ],
        include: [
          {
            association: "Stores",
            attributes: ["id", "district", "street", "number", "cep", "complement"]
          },
          {
            association: "Categories",
            attributes: ["id", "description"],
            through: { attributes: [] }
          },
          {
            association: "Platforms",
            attributes: ["id", "name"],
            through: { attributes: [] }
          }
        ]
      });

      //Se o jogo não for encontrado, retorna 404
      if (!game)
        return res.status(404).send({ erro: "Jogo não encontardo" });

      res.status(201).send(game);
    } catch (error) {
      console.log(error);
      res.status(500).send({ error });
    }
  },
  async update(req, res) {


    const id = req.params.id;    
    const {discount} = req.body

    try {
      const buy = await Game.findByPk(id);

      if(!buy)
        return res.status(404).send({error: "Jogo não encontrado para desconto"});
      
      buy.discount = discount;

      buy.save();

      res.status(204).send();

    } catch (error) {
      
    }
  }
}