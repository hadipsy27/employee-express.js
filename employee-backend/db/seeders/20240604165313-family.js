'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    const employeeFamilies = [
      {
        employee_id: 1,
        name: 'Stepani Nadia',
        identifier: '123456789012345',
        job: 'Doctor',
        place_of_birth: 'Jakarta',
        date_of_birth: new Date('1995-06-05'),
        religion: 'Islam',
        is_life: true,
        is_divorced: false,
        relation_status: 'Istri',
        created_by: 'admin',
        updated_by: 'admin',
        created_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
        updated_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
      },
      {
        employee_id: 1,
        name: 'Robert Wiliams',
        identifier: '123456789012346',
        job: 'Pelajar',
        place_of_birth: 'Jakarta',
        date_of_birth: new Date('2023-07-07'),
        religion: 'Islam',
        is_life: true,
        is_divorced: false,
        relation_status: 'Anak',
        created_by: 'admin',
        updated_by: 'admin',
        created_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
        updated_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
      },
      {
        employee_id: 1,
        name: 'Clara Kumala',
        identifier: '123456789012347',
        job: 'Pelajar',
        place_of_birth: 'Jakarta',
        date_of_birth: new Date('2028-01-03'),
        religion: 'Islam',
        is_life: true,
        is_divorced: false,
        relation_status: 'Anak',
        created_by: 'admin',
        updated_by: 'admin',
        created_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
        updated_at: new Date().toLocaleString('en-US', { timeZone: 'Asia/Jakarta' }),
      },

    ];

    await queryInterface.bulkInsert('employee_family', employeeFamilies, {});
  },

  async down (queryInterface, Sequelize) {
    await queryInterface.bulkDelete('employee_family', null, {});
  }
};
