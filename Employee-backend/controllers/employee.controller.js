const db = require("../models");
const Employee = db.employee;
const Op = db.Sequelize.Op;

// Create and Save a new Employee
exports.create = (req, res) => {

    // Validate request
    if (!req.body.nik) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
        return;
    }

    const employee = {
        nik: req.body.nik,
        name: req.body.name,
        is_active: req.body.isActive,
        start_date: req.body.startDate,
        end_date: req.body.endDate,
        created_by: req.body.createdBy,
        updated_by: req.body.updatedBy
    };

    Employee.create(employee)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while creating the Employee."
            });
        });

};