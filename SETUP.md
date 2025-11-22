# Quick Setup Guide

## Step 1: Initialize Flutter Project

If you haven't already, you need to create the Flutter project structure:

```bash
flutter create .
```

This will create the `android/`, `ios/`, and other necessary directories.

## Step 2: Install Dependencies

```bash
flutter pub get
```

## Step 3: Configure Firebase

1. **Install FlutterFire CLI:**
   ```bash
   dart pub global activate flutterfire_cli
   ```

2. **Login to Firebase:**
   ```bash
   firebase login
   ```

3. **Configure Firebase for your project:**
   ```bash
   flutterfire configure
   ```
   
   This will:
   - Detect your Firebase projects
   - Let you select a project
   - Generate `lib/common/firebase_options.dart` with your credentials
   - Configure Android and iOS apps

4. **Enable Firebase Services:**
   
   Go to [Firebase Console](https://console.firebase.google.com/) and enable:
   - **Authentication** → Sign-in method → Email/Password (enable it)
   - **Firestore Database** → Create database (start in test mode for development)
   - **Storage** (optional for MVP)
   - **Cloud Messaging** (optional for MVP)

5. **Set Firestore Security Rules:**
   
   In Firebase Console → Firestore Database → Rules:
   ```javascript
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {
       match /{document=**} {
         allow read, write: if request.auth != null;
       }
     }
   }
   ```

## Step 4: Configure Platform Permissions

### Android

Edit `android/app/src/main/AndroidManifest.xml`:

```xml
<manifest ...>
  <uses-permission android:name="android.permission.INTERNET"/>
  <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
  <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
  
  <application ...>
    ...
  </application>
</manifest>
```

### iOS

Edit `ios/Runner/Info.plist`:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>We need your location to show nearby events</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>We need your location to show nearby events</string>
```

## Step 5: Run the App

```bash
flutter run
```

## Troubleshooting

### Firebase Options Not Found

If you see an error about `firebase_options.dart`:
1. Make sure you ran `flutterfire configure`
2. The file should be at `lib/common/firebase_options.dart`
3. If it's in a different location, update the import in `lib/main.dart`

### Location Permissions

- On Android: Make sure location permissions are in `AndroidManifest.xml`
- On iOS: Make sure location usage descriptions are in `Info.plist`
- Test on a real device for best results (emulators may have location issues)

### Firestore Errors

- Make sure Firestore is enabled in Firebase Console
- Check that security rules allow authenticated users
- Verify that Authentication is set up correctly

## Next Steps

1. Test the authentication flow
2. Create a test event on the map
3. Join an event and test the chat
4. Test dark mode toggle in settings

