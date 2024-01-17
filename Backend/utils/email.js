require('dotenv').config(); 

const nodemailer = require('nodemailer');
const fs = require('fs');
const path = require('path');


const emailTemplate = fs.readFileSync(path.resolve(__dirname, './mailTemplates/regstrAdminNotify.html'), { encoding: 'utf-8' }); 

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: process.env.EMAIL,
    pass: process.env.pass
  },
});

const sendVerificationEmail = async (to, subject, cameraId, cameraOwnerName, message,verificationLink) => {
  // Replace placeholders in the template with actual data
  // const verificationLink=process.env.VERF_LINK;

  const formattedTemplate = emailTemplate
    .replace('{{cameraId}}', cameraId)
    .replace('{{cameraOwnerName}}', cameraOwnerName)
    .replace('{{message}}', message)
    .replace('{{verificationLink}}', verificationLink);

  try {
    // Send email
    await transporter.sendMail({
      from: process.env.EMAIL,
      to,
      subject,
      html: formattedTemplate,
    });

    console.log('Email sent successfully');
  } catch (error) {
    console.error('Error sending email:', error.message);
  }
};


module.exports = {transporter,sendVerificationEmail};

