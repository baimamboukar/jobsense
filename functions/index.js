const functions = require("firebase-functions");
const admin = require("firebase-admin");
const nodemailer = require("nodemailer");

admin.initializeApp();

const mailTransport = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "jobsense.ai@gmail.com",
    pass: "Shooter_8113",
  },
});

exports.sendWelcomeEmail = functions.auth.user().onCreate((user) => {
  const email = user.email;
  const displayName = user.displayName;

  const mailOptions = {
    from: "jobsense.ai@gmail.com",
    to: email,
    subject: "Welcome to Jobsense 🎉",
    text: `Hello ${
      displayName || ""
    }! Welcome to Jobsense. We are excited to have you on board.
    
          `,
  };

  return mailTransport.sendMail(mailOptions).then(() => {
    console.log(`Welcome email sent to: ${email}`);
    return null;
  });
});
