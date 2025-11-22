# Quick Firebase Web Configuration

## The Error
You're seeing `key=YOUR_WEB_API_KEY` in the error - this means Firebase still has placeholder values.

## Solution: Add Web App in Firebase Console

### Step 1: Add Web App
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select project: **hackatumsportsapp**
3. Click the **Web icon** (`</>`) or find "Add app" → Web
4. **App nickname**: "Sports Munich Web" (optional)
5. **Don't check** "Also set up Firebase Hosting" (unless you want it)
6. Click **Register app**

### Step 2: Copy Firebase Config
After registering, you'll see a config like:
```javascript
const firebaseConfig = {
  apiKey: "AIzaSyC...",
  authDomain: "hackatumsportsapp.firebaseapp.com",
  projectId: "hackatumsportsapp",
  storageBucket: "hackatumsportsapp.appspot.com",
  messagingSenderId: "728868505130",
  appId: "1:728868505130:web:abc123def456"
};
```

### Step 3: Update firebase_options.dart

Open `lib/common/firebase_options.dart` and replace the `webOptions`:

```dart
static const FirebaseOptions webOptions = FirebaseOptions(
  apiKey: 'AIzaSyC...',  // From firebaseConfig.apiKey
  appId: '1:728868505130:web:abc123def456',  // From firebaseConfig.appId
  messagingSenderId: '728868505130',  // From firebaseConfig.messagingSenderId
  projectId: 'hackatumsportsapp',  // From firebaseConfig.projectId
  storageBucket: 'hackatumsportsapp.appspot.com',  // From firebaseConfig.storageBucket
  authDomain: 'hackatumsportsapp.firebaseapp.com',  // From firebaseConfig.authDomain
);
```

### Step 4: Enable Authentication
1. In Firebase Console, go to **Authentication** → **Get started**
2. Click **Sign-in method** tab
3. Enable **Email/Password**
4. Click **Save**

### Step 5: Create Firestore Database
1. Go to **Firestore Database** → **Create database**
2. Start in **test mode** (for development)
3. Choose location (e.g., `europe-west3` for Munich)
4. Click **Enable**

### Step 6: Rebuild
```bash
flutter build web
# or
flutter run -d web-server
```

## Alternative: Use FlutterFire CLI

If you prefer automation:

```bash
flutterfire configure
```

Select:
- Project: `hackatumsportsapp`
- Platforms: Web (and others if you want)

This will automatically update `firebase_options.dart` with real values.

