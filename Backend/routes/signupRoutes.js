const express = require('express');
const router = express.Router();
const { userregister,
    userOtpSend,signup } = require('../controllers/signupController');

router.post("/register",userregister);
router.post("/sendotp",userOtpSend);
router.post("/signup", signup);


module.exports = router;


