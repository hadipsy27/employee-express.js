const {DataTypes} = require("sequelize");
module.exports = (sequelize, Sequelize) => {
    const EmployeeProfile = sequelize.define("employee_profile", {
        id: {
            type: Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        employeeId: {
            type: Sequelize.INTEGER,
            allowNull: false,
            unique: true,
            references: {
                model: 'employee',
                key: 'id'
            },
            field:'employee_id'
        },
        placeOfBirth: {
            type: Sequelize.STRING,
            allowNull: false,
            field: 'place_of_birth'
        },
        dateOfBirth: {
            type: Sequelize.STRING,
            allowNull: false,
            field: 'date_of_birth'
        },
        gender: {
            type: Sequelize.ENUM,
            values: ['Laki-laki', 'perempuan'],
            allowNull: false,
        },
        isMarried: {
            type: Sequelize.BOOLEAN,
            field: 'is_married'
        },
        profPict: {
            type: Sequelize.STRING,
            allowNull: true,
            field: 'prof_pict'
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

    return EmployeeProfile;
};
