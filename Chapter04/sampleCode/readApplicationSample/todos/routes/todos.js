var express = require('express');
var Promise = require('bluebird');
var mysql = require('mysql');
var router = express.Router();

var pool  = Promise.promisifyAll(mysql.createPool({
  connectionLimit : 3,
  host            : process.env.MYSQL_HOST,
  port            : process.env.MYSQL_PORT,
  user            : process.env.MYSQL_USER,
  password        : process.env.MYSQL_PASS,
  database        : process.env.MYSQL_DB,
}));

/* Show all todo. */
router.get('/', function(req, res, next) {
  pool.queryAsync('SELECT * FROM todos')
  .then(function(rows) {
    res.render('todos/index', { rows: rows });
  })
  .catch(function(error) {
    console.log("show all:" + error);
    return next(error);
  });
});

/* Show single todo. */
router.get('/:id', function(req, res, next) {
  const id = req.params.id;

  pool.queryAsync('SELECT * FROM todos WHERE id = ?', [id])
  .then(function(rows) {
    const row = rows[0];
    if (!row) return res.sendStatus(404);

    res.render('todos/show', { row: row });
  })
  .catch(function(error) {
    return next(error);
  });
});

module.exports = router;
