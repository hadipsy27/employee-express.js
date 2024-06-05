let {pool: pool} = require('../config/pool.config');
const db = require("../models");
const Employee = db.employee;
const Profile = db.employeeProfile;
const Family = db.employeeFamily;
const Education = db.education;
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
            res.status(201).send(data);
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

    Employee.findAll(
        {
            where: condition,
            include: [
                { model: Profile, as: 'employeeProfile' },
                { model: Family, as: 'employeeFamily'},
                { model: Education, as: 'education'}
            ]
        })
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

    Employee.findAll({where: {id: id},include: [
            { model: Profile, as: 'employeeProfile' },
            { model: Family, as: 'employeeFamily'},
            { model: Education, as: 'education'}
        ]})
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
        .then(() => res.status(200).send({
            message: "Employee was updated successfully."
        }))
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
        .then(() => res.status(200).send({
            message: "Employee was deleted successfully."
        }))
        .catch(err => {
            res.status(500).send({
                message: "Error deleting Employee with id=" + id
            });
        });
}


exports.employeeReport = (req, res) => {
    pool.query('SELECT\n' +
        '  e.id AS employee_id,\n' +
        '  e.nik,\n' +
        '  e.name,\n' +
        '  CASE WHEN e.is_active THEN \'true\' ELSE \'false\' END AS is_active,\n' +
        '  ep.gender,\n' +
        '  EXTRACT(YEAR FROM AGE(ep.date_of_birth)) || \' Years Old\' AS age,\n' +
        '  ed."name" AS school_name,\n' +
        '  ed.level as level,\n' +
        '  COALESCE(\n' +
        '      (CASE WHEN ef.suami > 0 THEN ef.suami || \' Suami & \' ELSE \'\' END) ||\n' +
        '      (CASE WHEN ef.istri > 0 THEN ef.istri || \' Istri & \' ELSE \'\' END) ||\n' +
        '      (CASE WHEN ef.anak > 0 THEN ef.anak || \' Anak \' ELSE \'\' END) ||\n' +
        '      (CASE WHEN ef.anak_sambung > 0 THEN ef.anak_sambung || \' & Anak Sambung\' ELSE \'\' END),\n' +
        '      \'-\'\n' +
        '  ) AS family_data\n' +
        'FROM employee e\n' +
        'LEFT JOIN employee_profile ep ON e.id = ep.employee_id\n' +
        'LEFT JOIN education ed ON e.id = ed.employee_id\n' +
        'LEFT JOIN (\n' +
        '  SELECT employee_id,\n' +
        '         COUNT(CASE WHEN relation_status = \'Suami\' THEN 1 ELSE NULL END) AS suami,\n' +
        '         COUNT(CASE WHEN relation_status = \'Istri\' THEN 1 ELSE NULL END) AS istri,\n' +
        '         COUNT(CASE WHEN relation_status = \'Anak\' THEN 1 ELSE NULL END) AS anak,\n' +
        '         COUNT(CASE WHEN relation_status = \'Anak Sambung\' THEN 1 ELSE NULL END) AS anak_sambung\n' +
        '  FROM employee_family\n' +
        '  WHERE employee_id IS NOT NULL\n' +
        '  GROUP BY employee_id\n' +
        ') ef ON e.id = ef.employee_id;' +
        '', (err, result) => {
        if (err) throw err;

        res.status(200).send(result.rows);
    })
}