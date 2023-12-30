const express = require('express');
const router = express.Router();
const { changePassword } = require('../controllers/passwordChangeController');

router.post('/', changePassword);

module.exports = router;
