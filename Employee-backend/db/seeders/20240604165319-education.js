'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    const educations = [
      {
        employee_id: 1,
        name: 'Institut Teknologi Bandung',
        level: 'Strata 1',
        description: 'Bachelor of Science in Computer Science',
        created_by: 'admin',
        updated_by: 'admin',
        created_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
        updated_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
      },
      {
        employee_id: 2, // Assuming employee with ID 2 exists
        name: 'SMK Nusa Bangsa',
        level: 'Sma',
        description: 'Ilmu Pengetahuan Alam',
        created_by: 'admin',
        updated_by: 'admin',
        created_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
        updated_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
      },
    ];

    await queryInterface.bulkInsert('education', educations, {});
  },

  async down (queryInterface, Sequelize) {
    await queryInterface.bulkDelete('education', null, {});
  }
};
