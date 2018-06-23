var express = require('express');
var router = express.Router();

/* Get root page. */
router.get('/', function(req, res, next) {
  res.redirect('/todos');
});

module.exports = router;
