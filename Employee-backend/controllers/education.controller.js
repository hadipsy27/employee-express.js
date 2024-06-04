const db = require("../models");
const {create} = require("./employee.controller");
const Education = db.education;
const Op = db.Sequelize.Op;

exports.create = (req, res) => {
    const employeeId = req.params.id; // Get employeeId from URL parameter

    if (!employeeId) {
        res.status(400).send({
            message: "employeeId is required in the URL!"
        });
        return;
    }

    // TODO: Implement validation to check if employee exists (e.g., using findById)

    const education = {
        employeeId, // Use retrieved employeeId
        name: req.body.name,
        level: req.body.level,
        description: req.body.description,
        createdBy: req.body.createdBy,
        updatedBy: req.body.updatedBy
    };

    Education.create(education)
        .then(data => {
            res.status(201).send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while creating the Education."
            });
        });
};

exports.findAll = (req, res) => {
    const id = req.query.id;
    var condition = id ? {id: {[Op.iLike]: `%${id}%`}} : null;

    Education.findAll({where: condition})
        .then(data => {
            res.status(200).send(data);
        })
        .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while retrieving Educations."
            });
        });
}


exports.findOne = (req, res) => {
    const id = req.params.id;

    Education.findByPk(id)
        .then(data => {
            if (data) {
                res.status(200).send(data);
            } else {
                res.status(404).send({
                    message: `Cannot find Education with id=${id}.`
                });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: "Error retrieving Education with id=" + id
            });
        });
}


exports.update = (req, res) => {
    const id = req.params.id;

    Education.update(req.body, {
        where: {id: id}
    })
        .then(() => res.status(200).send({
            message: "Education was updated successfully."
        }))
        .catch(err => {
            res.status(500).send({
                message: "Error updating Education with id=" + id
            });
        });
}


exports.delete = (req, res) => {
    const id = req.params.id;

    Education.destroy({
        where: {id: id}
    })
        .then(() => res.status(200).send({
            message: "Education was deleted successfully!"
        }))
        .catch(err => {
            res.status(500).send({
                message: "Could not delete Education with id=" + id
            });
        });
}