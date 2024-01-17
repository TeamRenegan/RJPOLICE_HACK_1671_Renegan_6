const {transporter} = require('../utils/email');
const users = require("../models/user");
const userotp = require("../models/userOtp");
const generateOTP = require('../utils/otpGenerator');
const { getSpreadSheetValues } = require("../utils/googleSheetsService");

const userregister = async (req, res) => {
    const { name, email , contactNo , password ,location } = req.body;

    if (!name || !email || !contactNo || !password || !location) {
        return res.status(400).json({ error: "Please enter all input data" });
    }


    try {
        const preuser = await users.findOne({ email: email });

        if (preuser) {
            return res.status(400).json({ error: "This user already exists" });
        } else {
            const newUser = new users({ name,  email,contactNo , password,location });
            newUser.role="User";
            const storedData = await newUser.save();
            res.status(200).json(storedData);
        }
    } catch (error) {
        res.status(400).json({ error: "Invalid details", error });
    }
}

const adminregister = async (req, res) => {

    const { name,  email, contactNo, password,location } = req.body;

    if (!name ||  !email || !contactNo || !password || !location) {
        return res.status(400).json({ error: "Please enter all input data" });
    }

    const AdminsRegs=await getSpreadSheetValues();
    const admins=AdminsRegs.data.values;

    const adminList=admins[0].slice(1);
    console.log("list of admins ",adminList);
    if(!adminList.includes(email)){
        return res.status(400).send({message:"Admin  not found. "});
    }
    try {
        const preuser = await users.findOne({ email: email });

        if (preuser) {
            return res.status(400).json({ error: "This user already exists" });
        } else {
            const newUser = new users({ name,  email, contactNo, password,location });
            newUser.role="Admin";
            const storedData = await newUser.save();
            res.status(200).json(storedData);
        }
    } catch (error) {
        res.status(400).json({ error: "Invalid details", error });
    }
}

const userOtpSend = async (req, res) => {
    const { email } = req.body;

    if (!email) {
        return res.status(400).json({ error: "Please enter your email" });
    }

    try {
        const preuser = await users.findOne({ email: email });

        if (preuser) {
            const otp = generateOTP();

            let existingEmail = await userotp.findOne({ email: email });

            if (existingEmail) {
                existingEmail.otp = otp;
                await existingEmail.save();
            } else {
                const saveOtpData = new userotp({ email, otp });
                await saveOtpData.save();
            }

            const mailOptions = {
                from: { name : " Renegan " , address :process.env.EMAIL},
                to: email,
                subject: ' Verification OTP ',
                text: ` Your OTP for signup is: ${otp} `,
            };

            transporter.sendMail(mailOptions, (error, info) => {
                if (error) {
                    console.error(" Error: ", error);
                    res.status(400).json({ error: " Email not sent " });
                } else {
                    console.log(" Email sent ", info.response);
                    res.status(200).json({ message: " Email sent successfully " });
                }
            });
        } else {
            res.status(400).json({ error: " Sign Up required " });
        }
    } catch (error) {
        res.status(400).json({ error: " Invalid details ", error });
    }
}

const signup = async (req, res) => {
    const { email, otp } = req.body;

    if (!email || !otp) {
        return res.status(400).json({ error: " Please enter your OTP and email " });
    }

    try {
        const otpVerification = await userotp.findOne({ email: email });

        if (otpVerification && otpVerification.otp === otp) {
            const preuser = await users.findOne({ email: email });
            const token = await preuser.generateAuthtoken();
            res.status(200).json({ message: " User logged in successfully ", userToken: token });
        } else {
            res.status(400).json({ error: " Invalid OTP " });
        }
    } catch (error) {
        res.status(400).json({ error: " Invalid details ", error });
    }
}

module.exports = {
    userregister,
    adminregister,
    userOtpSend,
    signup
};


