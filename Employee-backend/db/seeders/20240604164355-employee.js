'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    await queryInterface.bulkInsert('employee', [
      {
        nik: '117790',
        name: 'John Doel',
        is_active: true,
        start_date: new Date('2023-01-01'),
        end_date: new Date('2024-06-05'),
        created_by: 'admin',
        updated_by: 'admin',
        created_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
        updated_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
      },
      {
        nik: '117791',
        name: 'Budi Alexander',
        is_active: true,
        start_date: new Date('2023-01-01'),
        end_date: new Date('2024-06-05'),
        created_by: 'admin',
        updated_by: 'admin',
        created_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
        updated_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
      }
      ], {});
  },

  async down (queryInterface, Sequelize) {
    await queryInterface.bulkDelete('employee', null, {});
  }
};
