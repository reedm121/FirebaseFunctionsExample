const { onCall, onRequest } = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

exports.helloWorld = onCall((data, context) => {
    // Log the user's authentication status
    if (context.auth) {
        logger.info("User is authenticated:", context.auth.uid);
    } else {
        logger.info("User is not authenticated.");
    }

    return { 
        message: "Hello World from Firebase function!",
        timestamp: Date.now()
     };
});

exports.requestCall = onRequest((request, response) => {
    logger.info("Hello logs!", { structuredData: true });
    response.send("hello world");
});
