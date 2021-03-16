const Sequelize = require("sequelize");
const dbConfig = require("../config/database");

//imports dos models
const Game = require("../models/Game");
const Store = require("../models/Store");
const Category = require("../models/Category");
const Platform = require("../models/Platform");
const Order = require("../models/Order");

const connection = new Sequelize(dbConfig);

//inicializa os models
Game.init(connection);
Store.init(connection);
Category.init(connection);
Platform.init(connection);
Order.init(connection);


//inicializa os relacionamentos
Game.associate(connection.models);
Store.associate(connection.models);
Category.associate(connection.models);
Platform.associate(connection.models);
Order.associate(connection.models);


//  for (let assoc of Object.keys(Game.associations)) {
//    for (let accessor of Object.keys(Game.associations[assoc].accessors)) {
//         console.log(Game.name + '.' + Game.associations[assoc].accessors[accessor] + '()');
//    }
//  }