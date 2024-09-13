const nodemailer = require('nodemailer');
const sendGridTransport = require('nodemailer-sendgrid-transport');
const {
  generateNewPhraseEmail,
  generateOTPEmail,
} = require('../utils/commonUtils/generateEmail');

const transporter = nodemailer.createTransport(
  sendGridTransport({
    auth: {
      api_key: process.env.SENDGRID_API_KEY,
    },
  })
);

async function sendSignUpMail(email, otp) {
  const data = {
    heading: 'confirm your email address',
    message: `your confirmation code is below - enter it in and we'll help you get registered.`,
    code: otp,
    expirationMessage: 'this code will expire in 1 hour.',
  };
  return transporter.sendMail({
    to: email,
    from: process.env.SENDGRID_MAIL_FROM,
    subject: 'Your OTP Verification Code',
    html: generateOTPEmail(data),
  });
}

async function sendPasswordRecoveryMailForDriver(email, otp) {
  const data = {
    heading: 'reset your password',
    message: `your confirmation code is below - enter it in and we'll help you reset your password.`,
    code: otp,
    expirationMessage: 'this code will expire in 1 hour.',
  };
  return transporter.sendMail({
    to: email,
    from: process.env.SENDGRID_MAIL_FROM,
    subject: 'Your Password Recovery OTP',
    html: generateOTPEmail(data),
  });
}

async function sendToMailNewPhrase(subject, email, obj) {
  return transporter.sendMail({
    to: email,
    from: process.env.SENDGRID_MAIL_FROM,
    subject,
    html: generateNewPhraseEmail(obj),
  });
}

module.exports = {
  sendSignUpMail,
  sendPasswordRecoveryMailForDriver,
  // Same Implementation For Now Will Change If User And Driver Has Different Flow
  sendPasswordRecoveryMailForApp: sendPasswordRecoveryMailForDriver,
  sendToMailNewPhrase,
};
