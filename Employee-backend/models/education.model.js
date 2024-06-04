const {DataTypes} = require("sequelize");
module.exports = (sequelize, Sequelize) => {
    const Education = sequelize.define("education", {
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
        level: {
            type: Sequelize.ENUM,
            values: ['Tk', 'Sd', 'Smp','Sma','Strata 1','Strata 2','Doktor','Profesor'],
            allowNull: false,
        },
        description: {
            type: Sequelize.STRING,
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

    return Education;
};
