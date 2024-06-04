const dbConfig = require("../config/db.config.js");

const Sequelize = require("sequelize");
const sequelize = new Sequelize(dbConfig.DB, dbConfig.USER, dbConfig.PASSWORD, {
    host: dbConfig.HOST,
    dialect: dbConfig.dialect,
    operatorsAliases: false,

    pool: {
        max: dbConfig.pool.max,
        min: dbConfig.pool.min,
        acquire: dbConfig.pool.acquire,
        idle: dbConfig.pool.idle
    },
    define: {
        freezeTableName: true
    }
});

const db = {};

db.Sequelize = Sequelize;
db.sequelize = sequelize;

db.employee = require("./employee.model.js")(sequelize, Sequelize);
db.employeeProfile = require("./employee-profile.model.js")(sequelize, Sequelize);
db.education = require("./education.model.js")(sequelize, Sequelize);
db.employeeFamily = require("./employee-family.model.js")(sequelize, Sequelize);

db.employee.hasOne(db.employeeProfile, {foreignKey: 'employee_id', as: 'employee'});
db.employeeProfile.belongsTo(db.employee, {foreignKey: 'employee_id', as: 'employeeProfile'});

db.employee.hasMany(db.education, {foreignKey: 'employee_id', as: 'education'});
db.education.belongsTo(db.employee, {foreignKey: 'employee_id', as: 'education'});

db.employee.hasMany(db.employeeFamily, {foreignKey: 'employee_id', as: 'employeeFamily'});
db.employeeFamily.belongsTo(db.employee, {foreignKey: 'employee_id', as: 'employeeFamily'});

module.exports = db;