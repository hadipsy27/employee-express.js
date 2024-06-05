module.exports = app => {
    const education = require("../controllers/education.controller.js");

    var router = require("express").Router();

    router.post("/employee/:id", education.create);

    router.get("/", education.findAll);

    router.get("/:id", education.findOne);

    router.put("/:id", education.update);

    router.delete("/:id", education.delete);

    app.use("/api/educations", router);
}
