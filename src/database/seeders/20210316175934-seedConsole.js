'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.bulkInsert('platforms', 
    [
      {
        name: 'PS4',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        name: 'PS3',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        name: 'PS2',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        name: 'PC',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        name: 'XBOXONE',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        name: 'XBOX360',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        name: 'NINTENDOSWITCH',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
      {
        name: 'WIIU',
        createdAt: new Date (),
        updatedAt: new Date ()
      },
    ],{})
  },

  down: async (queryInterface, Sequelize) => {
      await queryInterface.bulkDelete('platforms', null, 
      {})
  }
};
