const express = require('express');
const router = express.Router();
const { loginUser } = require('../controllers/loginController');

// POST route for user login
router.post('/', loginUser);

module.exports = router;
