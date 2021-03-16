'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert('categories', 
    [
      {
        description: 'Ação',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        description: 'Aventura',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        description: 'Estratégia',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        description: 'RPG',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        description: 'Esporte',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        description: 'Corrida',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        description: 'Mech',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        description: 'FPS',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        description: 'Battle Royale',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        description: 'Fantasia',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        description: 'music',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        description: 'Romance',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
    ],{})
  },

  down: async (queryInterface, Sequelize) => {
      await queryInterface.bulkDelete('categories', null, 
      {})
  }
};
