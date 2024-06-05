const {Pool} = require("pg");

var pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'data_kepegawaian',
    password: '123',
    port: 5432,
});

module.exports = {pool};