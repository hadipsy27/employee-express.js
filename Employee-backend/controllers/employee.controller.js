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
        isActive: req.body.isActive,
        startDate: req.body.startDate,
        endDate: req.body.endDate,
        createdBy: req.body.createdBy,
        updatedBy: req.body.updatedBy
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

exports.findAll = (req, res) => {
    const name = req.query.name;
    var condition = name ? {name: {[Op.iLike]: `%${name}%`}} : null;

    Employee.findAll({where: condition})
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while retrieving employees."
            });
        });
}

exports.findOne = (req, res) => {
    const id = req.params.id;

    Employee.findByPk(id)
        .then(data => {
            if (data) {
                res.send(data);
            } else {
                res.status(404).send({
                    message: `Cannot find Employee with id=${id}.`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Error retrieving Employee with id=" + id
            });
        });
}

exports.update = (req, res) => {
    const id = req.params.id;

    Employee.update(req.body, {
        where: {id: id}
    })
        .then(num => {
            if (num == 1) {
                res.send({
                    message: "Employee was updated successfully."
                });
            } else {
                res.send({
                    message: `Cannot update Employee with id=${id}. Maybe Employee was not found or req.body is empty!`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Error updating Employee with id=" + id
            });
        });

}

exports.delete = (req, res) => {
    const id = req.params.id;

    Employee.destroy({
        where: {id: id}
    })
        .then(num => {
            if (num == 1) {
                res.send({
                    message: "Employee was deleted successfully!"
                });
            } else {
                res.send({
                    message: `Cannot delete Employee with id=${id}. Maybe Employee was not found!`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Error deleting Employee with id=" + id
            });
        });
}