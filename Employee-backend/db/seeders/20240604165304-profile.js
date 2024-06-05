'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    const employeeProfiles = [
      {
        employee_id: 1,
        place_of_birth: 'Jakarta',
        date_of_birth: '1990-01-01',
        gender: 'Laki-laki',
        is_married: true,
        prof_pict: 'profile_picture.jpg',
        created_by: 'admin',
        updated_by: 'admin',
        created_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
        updated_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
      },
      {
        employee_id: 2,
        place_of_birth: 'Sukabumi',
        date_of_birth: '1995-01-01',
        gender: 'Laki-laki',
        is_married: false,
        prof_pict: 'prof_picture.jpg',
        created_by: 'admin',
        updated_by: 'admin',
        created_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
        updated_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
      },
    ];

    await queryInterface.bulkInsert('employee_profile', employeeProfiles, {});
  },

  async down (queryInterface, Sequelize) {

    await queryInterface.bulkDelete('employee_profile', null, {});
  }
};
