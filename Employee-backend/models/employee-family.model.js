const {DataTypes} = require("sequelize");
module.exports = (sequelize, Sequelize) => {
    const EmployeeFamily = sequelize.define("employee_family", {
        id: {
            type: Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        employeeId: {
            type: Sequelize.INTEGER,
            allowNull: false,
            references: {
                model: 'employee',
                key: 'id'
            },
            field:'employee_id'
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
        placeOfBirth: {
            type: Sequelize.STRING,
            allowNull: false,
            field: 'place_of_birth'
        },
        dateOfBirth: {
            type: Sequelize.DATE,
            allowNull: false,
            field: 'date_of_birth'
        },
        religion: {
            type: Sequelize.ENUM,
            values: ['Islam', 'Katolik', 'Buda','Protestan', 'Konghucu'],
        },
        isLife: {
            type: Sequelize.BOOLEAN,
            default: true,
            field: 'is_life'
        },
        isDivorced: {
            type: Sequelize.BOOLEAN,
            default: false,
            field: 'is_divorced'
        },
        relationStatus: {
            type: Sequelize.ENUM,
            values: ['Suami', 'Istri', 'Anak', 'Anak Sambung'],
            allowNull: false,
            field: 'relation_status'
        },
        createdBy: {
            type: Sequelize.STRING,
            field: 'created_by'
        },
        updatedBy: {
            type: Sequelize.STRING,
            field: 'updated_by'
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
