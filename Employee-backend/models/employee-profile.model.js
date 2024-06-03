const {DataTypes} = require("sequelize");
module.exports = (sequelize, Sequelize) => {
    const EmployeeProfile = sequelize.define("employee_profile", {
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
        place_of_birth: {
            type: Sequelize.STRING,
            allowNull: false
        },
        date_of_birth: {
            type: Sequelize.STRING,
            allowNull: false
        },
        gender: {
            type: Sequelize.ENUM,
            values: ['Laki-laki', 'perempuan'],
            allowNull: false,
        },
        is_married: {
            type: Sequelize.BOOLEAN,
        },
        prof_pict: {
            type: Sequelize.STRING,
            allowNull: true
        },
        created_by: {
            type: Sequelize.STRING
        },
        updated_by: {
            type: Sequelize.STRING
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

    return EmployeeProfile;
};
