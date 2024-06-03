module.exports = app => {
    const employee = require("../controllers/employee.controller.js");

    var router = require("express").Router();

    // Create a new Tutorial
    router.post("/", employee.create);

    app.use('/api/employee', router);
}