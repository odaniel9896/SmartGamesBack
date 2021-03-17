'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.addColumn('stores', 
    'altitude', 
    {
      type: Sequelize.DOUBLE
    }
  )
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeColumn('stores', 'altitude', {});
  }
};
