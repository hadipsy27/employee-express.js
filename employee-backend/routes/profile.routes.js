const family = require("../controllers/family.controller");
const profile = require("../controllers/profile.controller");
module.exports = app => {
    const profile = require("../controllers/profile.controller.js");

    var router = require("express").Router();

    router.post("/employee/:id", profile.create);

    router.get("/", profile.findAll);

    router.get("/:id", profile.findOne);

    router.put("/:id", profile.update);

    router.delete("/:id", profile.delete);

    app.use("/api/profile", router);
}