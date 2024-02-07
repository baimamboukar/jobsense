const functions = require("firebase-functions");
const admin = require("firebase-admin");
const AWS = require("aws-sdk");

admin.initializeApp();

const ses = new AWS.SES({
  region: "us-east-1",
  accessKeyId: "AKIARQPKV7LO57P62F5I",
  secretAccessKey: "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",
});

exports.sendWelcomeEmail = functions.auth.user().onCreate(async (user) => {
  const userEmail = user.email;

  const params = {
    Destination: {
      ToAddresses: [userEmail],
    },
    Message: {
      Body: {
        Text: {
          Data: `Welcome to Jobsebse! Your account has been created with email: ${userEmail} and user id: ${user.uid}.`,
        },
      },
      Subject: {
        Data: "Welcome to Jobsense 🎉",
      },
    },
    Source: "baimamboukar@gmail.com",
  };

  return ses
    .sendEmail(params)
    .promise()
    .then(() => {
      console.log(`Welcome email sent to: ${userEmail}`);
      return null;
    });
});
