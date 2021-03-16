'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.addColumn('games', 
    'image', 
    {
      type: Sequelize.STRING
    }
  )
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeColumn('games', 'image', {});
  }
};
