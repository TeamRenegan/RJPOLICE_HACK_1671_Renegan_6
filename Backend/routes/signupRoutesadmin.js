const express = require('express');
const router = express.Router();
const { adminregister,
    userOtpSend,signup
    } = require('../controllers/signupController');

router.post("/register",adminregister);
router.post("/sendotp",userOtpSend);
router.post("/signup", signup);


module.exports = router;


