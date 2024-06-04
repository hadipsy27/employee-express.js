const {DataTypes} = require("sequelize");
module.exports = (sequelize, Sequelize) => {
    const Employee = sequelize.define("employee", {
        id: {
            type: Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        nik: {
            type: Sequelize.STRING,
            unique: true,
            allowNull: true
        },
        name: {
            type: Sequelize.STRING,
            allowNull: true
        },
        isActive: {
            type: Sequelize.BOOLEAN,
            field: 'is_active'
        },
        startDate: {
            type: DataTypes.DATE,
            allowNull: false,
            field: 'start_date'
        },
        endDate: {
            type: DataTypes.DATE,
            allowNull: false,
            field: 'end_date'
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

    return Employee;
};
