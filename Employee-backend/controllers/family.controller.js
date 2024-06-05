const db = require("../models");
const Family = db.employeeFamily;
const Employee = db.employee;
const Op = db.Sequelize.Op;

exports.create = async (req, res) => {
    const employeeId = req.params.id;

    if (!employeeId) {
        res.status(400).send({
            message: "employeeId is required in the URL!"
        });
        return;
    }

    try {
        const employee = await Employee.findByPk(employeeId);

        if (!employee) {
            return res.status(404).send({
                message: `Employee with ID ${employeeId} not found.`
            });
        }

        const family = {
            employeeId,
            name: req.body.name,
            identifier: req.body.identifier,
            job: req.body.job,
            placeOfBirth: req.body.placeOfBirth,
            dateOfBirth: req.body.dateOfBirth,
            religion: req.body.religion,
            isLife: req.body.isLife,
            isDivorced: req.body.isDivorced,
            relationStatus: req.body.relationStatus,
            createdBy: req.body.createdBy,
            updatedBy: req.body.updatedBy
        };

        Family.create(family)
            .then(data => {
                res.status(201).send(data);
            })
            .catch(err => {
                res.status(500).send({
                    message:
                        err.message || "Some error occurred while creating the Family."
                });
            });
    } catch (error) {
        console.error(error.message);
        res.status(500).send({
            message: "Internal server error."
        });
    }
};

exports.findAll = (req, res) => {
    const name = req.query.name;
    var condition = name? {name: {[Op.iLike]: `%${name}%`}} : null;

    Family.findAll({where: condition})
        .then(data => {
            res.status(200).send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while retrieving profiles."
            });
        });
}

exports.findAllFamilyEmployee = (req, res) => {
    const employeeId = req.params.id;

    if (!employeeId) {
        res.status(400).send({
            message: "employeeId is required in the URL!"
        });
        return;
    }

    Family.findAll({
        where: {
            employeeId
        }
    })
       .then(data => {
            res.send(data);
        })
       .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while retrieving families."
            });
        });
}

exports.findOne = (req, res) => {
    const id = req.params.id;

    Family.findByPk(id)
       .then(data => {
            if (data) {
                res.send(data);
            } else {
                res.status(404).send({
                    message: "Not found Family with id " + id
                });
            }
        })
       .catch(err => {
            res.status(500).send({
                message: "Error retrieving Family with id=" + id
            });
        });
}

exports.update = (req, res) => {
    const id = req.params.id;

    Family.update(req.body, {
        where: {id: id}
    })
       .then(() => res.status(200).send({
            message: "Family was updated successfully."
        }))
       .catch(err => {
            res.status(500).send({
                message: "Error updating Family with id=" + id
            });
        });
}

exports.delete = (req, res) => {
    const id = req.params.id;

    Family.destroy({
        where: {id: id}
    })
       .then(() => res.status(200).send({
            message: "Family was deleted successfully!"
        }))
       .catch(err => {
            res.status(500).send({
                message: "Could not delete Family with id=" + id
            });
        });
}
