const mysql     = require('mysql');
require("dotenv").config();

let connectionLimit = 10;
let pool = mysql.createPool(
    {
        connectionLimit: connectionLimit,
        host: process.env.HOST_DB,
        user: process.env.USERNAME_DB,
        password: process.env.PASS_DB,
        database: process.env.NAME_DB
    }
);


module.exports.pool = pool;


