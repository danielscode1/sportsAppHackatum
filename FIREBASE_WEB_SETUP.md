# Firebase Web Setup - Quick Fix

## The Problem

The error shows Firebase isn't configured for web. You need to:

1. **Add a Web app in Firebase Console**
2. **Run `flutterfire configure`** to generate real credentials

## Step-by-Step

### 1. Add Web App in Firebase Console

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project `hackatumsportsapp`
3. Click the **Web icon** (`</>`) or "Add app" → Web
4. **App nickname**: "Sports Munich Web" (optional)
5. **Don't check** "Also set up Firebase Hosting" (unless you want it)
6. Click **Register app**
7. **Copy the Firebase config** - you'll see something like:
   ```javascript
   const firebaseConfig = {
     apiKey: "AIza...",
     authDomain: "hackatumsportsapp.firebaseapp.com",
     projectId: "hackatumsportsapp",
     storageBucket: "hackatumsportsapp.appspot.com",
     messagingSenderId: "123456789",
     appId: "1:123456789:web:abc123"
   };
   ```

### 2. Run FlutterFire Configure

```bash
flutterfire configure
```

When prompted:
- Select project: `hackatumsportsapp`
- Select platforms: **Web**, Android, iOS (or just Web for now)
- It will automatically fill in the values from Firebase Console

### 3. Rebuild

```bash
flutter build web
# or
flutter run -d web-server
```

## Alternative: Manual Configuration (If flutterfire configure doesn't work)

If `flutterfire configure` doesn't work, you can manually update `lib/common/firebase_options.dart`:

Replace the `webOptions` with values from Firebase Console:

```dart
static const FirebaseOptions webOptions = FirebaseOptions(
  apiKey: 'AIza...',  // From firebaseConfig.apiKey
  appId: '1:123456789:web:abc123',  // From firebaseConfig.appId
  messagingSenderId: '123456789',  // From firebaseConfig.messagingSenderId
  projectId: 'hackatumsportsapp',  // From firebaseConfig.projectId
  storageBucket: 'hackatumsportsapp.appspot.com',  // From firebaseConfig.storageBucket
  authDomain: 'hackatumsportsapp.firebaseapp.com',  // From firebaseConfig.authDomain
);
```

## Quick Test

After configuring, the app should load (though you'll still need to set up Authentication and Firestore in Firebase Console for it to work fully).

