const db = require("../models");
const Profile = db.employeeProfile;
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
    const profile = {
        employeeId, // Use retrieved employeeId
        placeOfBirth: req.body.placeOfBirth,
        dateOfBirth: req.body.dateOfBirth,
        gender: req.body.gender,
        isMarried: req.body.isMarried,
        profPict: req.body.profPict,
        createdBy: req.body.createdBy,
        updatedBy: req.body.updatedBy
    };

    Profile.create(profile)
       .then(data => {
            res.send(data);
        })
       .catch(err => {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while creating the Profile."
            });
        });
}

exports.findAll = (req, res) => {
    const id = req.query.id;
    var condition = id? {id: {[Op.iLike]: `%${id}%`}} : null;

    Profile.findAll({where: condition})
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

exports.findOne = (req, res) => {
    const id = req.params.id;

    Profile.findByPk(id)
       .then(data => {
            if (data) {
                res.status(200).send(data);
            } else {
                res.status(404).send({
                    message: "Profile not found with id " + id
                });
            }
        })
       .catch(err => {
            res.status(500).send({
                message: "Error retrieving Profile with id=" + id
            });
        });
}

exports.update = (req, res) => {
    const id = req.params.id;

    Profile.update(req.body, {
        where: {id: id}
    })
       .then(() => res.status(200).send({
            message: "Profile was updated successfully."
        }))
       .catch(err => {
            res.status(500).send({
                message: "Error updating Profile with id=" + id
            });
        });
}

exports.delete = (req, res) => {
    const id = req.params.id;

    Profile.destroy({
        where: {id: id}
    })
       .then(() => res.status(200).send({
            message: "Profile was deleted successfully!"
        }))
       .catch(err => {
            res.status(500).send({
                message: "Could not delete Profile with id=" + id
            });
        });
}