var express = require('express');
var hbs = require('hbs');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res) {
	// 设置不使用layout模板
	hbs.layout = false;
	res.render('home/index', {
		title: 'Express',
		user: {
            ID: 'abcd',
			RealName: 'jasper'
		}
	});
});

module.exports = router;