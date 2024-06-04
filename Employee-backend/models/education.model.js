const {DataTypes} = require("sequelize");
module.exports = (sequelize, Sequelize) => {
    const Education = sequelize.define("education", {
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
        level: {
            type: Sequelize.ENUM,
            values: ['Tk', 'Sd', 'Smp','Sma','Strata 1','Strata 2','Doktor','Profesor'],
            allowNull: false,
        },
        description: {
            type: Sequelize.STRING,
            allowNull: false,
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

    return Education;
};
