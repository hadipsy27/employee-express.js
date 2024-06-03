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
            allowNull: true
        },
        name: {
            type: Sequelize.STRING,
            allowNull: true
        },
        is_active: {
            type: Sequelize.BOOLEAN,
        },
        start_date: {
            type: DataTypes.DATE,
            allowNull: false,
        },
        end_date: {
            type: DataTypes.DATE,
            allowNull: false,
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

    return Employee;
};
