# Firebase functions iOS App
Made alongside [this Medium article](https://medium.com/@reedm121/serverless-ios-integrating-firebase-functions-into-your-native-ios-app-2639a5b40cfa)
![Screen Recording 2025-02-12 at 11 59 53 AM](https://github.com/user-attachments/assets/1e9f01f1-6a17-413a-8209-a0ec9ac9a04b)

<br>

    
# How to deploy a Firebase function

## **1 Install Firebase CLI (If Not Installed)**
If you haven’t installed Firebase CLI, run:
```sh
npm install -g firebase-tools
```
Or update it:
```sh
firebase update
```

---

## **2 Login & Initialize Firebase in Your Project**
If you haven’t logged in yet:
```sh
firebase login
```
Then, navigate to your project folder:
```sh
cd your-firebase-functions-project
```
Initialize Firebase functions (if you haven’t already):
```sh
firebase init functions
```
- Choose **Node.js** as the runtime.
- Select **JavaScript or TypeScript**.
- Enable **Emulators** (optional, for local testing).

---

## **3 Write Your Function (`index.js`)**
Example **Firebase Function** (`functions/index.js`):
```javascript
const { onCall } = require("firebase-functions/v2/https");

exports.helloWorld = onCall((data, context) => {
    return { message: "Hello from Firebase!" };
});
```

---

## **4 Deploy Your Function**
Run:
```sh
firebase deploy --only functions
```
✅ **This deploys your function to Firebase Cloud Functions.**

---

## **5 Check Your Deployed Function**
After deployment, Firebase will print:
```sh
✔ Deploy complete!

Function URL (onCall):
https://us-central1-your-project.cloudfunctions.net/helloWorld
```
You can now call it from your app using Firebase SDK.

---

### **🔥 Summary**
| **Step** | **Command** |
|----------|------------|
| Install Firebase CLI | `npm install -g firebase-tools` |
| Login to Firebase | `firebase login` |
| Initialize Functions | `firebase init functions` |
| Deploy Functions | `firebase deploy --only functions` |

🔥 **That's it! Your Firebase Function is live!** 🚀
