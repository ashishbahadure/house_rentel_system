
// Database Connection

var mysql = require("mysql");
var conn = mysql.createPool({
    connectionLimit:10,
    host:"localhost",
    user:"root",
    password:"",
    database:"room_point_db"
});

var util = require("util");
var execute = util.promisify(conn.query).bind(conn);
module.exports = execute;

