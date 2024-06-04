const {DataTypes} = require("sequelize");
module.exports = (sequelize, Sequelize) => {
    const EmployeeFamily = sequelize.define("employee_family", {
        id: {
            type: Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        employee_id: {
            type: Sequelize.INTEGER,
            allowNull: false,
            unique: true,
            references: {
                model: 'employee',
                key: 'id'
            }
        },
        name: {
            type: Sequelize.STRING,
        },
        identifier: {
            type: Sequelize.STRING,
        },
        job: {
            type: Sequelize.STRING,
        },
        place_of_birth: {
            type: Sequelize.STRING,
            allowNull: false
        },
        date_of_birth: {
            type: Sequelize.STRING,
            allowNull: false
        },
        religion: {
            type: Sequelize.ENUM,
            values: ['Islam', 'Katolik', 'Buda','Protestan', 'Konghucu'],
        },
        is_life: {
            type: Sequelize.BOOLEAN,
            default: true
        },
        is_divorced: {
            type: Sequelize.BOOLEAN,
            default: false
        },
        relation_status: {
            type: Sequelize.ENUM,
            values: ['Suami', 'Istri', 'Anak', 'Anak Sambung'],
            allowNull: false,
        },
        created_by: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        updated_by: {
            type: Sequelize.STRING,
            allowNull: false,
        },
        createdAt: {
            type: Sequelize.DATE,
            field: 'created_at'
        },
        updatedAt: {
            type: Sequelize.DATE,
            field: 'updated_at'
        },
    });

    return EmployeeFamily;
};
