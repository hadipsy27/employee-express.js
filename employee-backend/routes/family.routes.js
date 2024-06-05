const education = require("../controllers/education.controller");
const family = require("../controllers/family.controller");
module.exports = app => {
    const family = require("../controllers/family.controller.js");

    var router = require("express").Router();

    router.post("/employee/:id", family.create);

    router.get("/", family.findAll);

    router.get("/employee/:id", family.findAllFamilyEmployee);

    router.get("/:id", family.findOne);

    router.put("/:id", family.update);

    router.delete("/:id", family.delete);

    app.use("/api/family", router);
}