# Next Steps - Firebase Configuration

## ✅ What's Done
- ✅ `xcodeproj` gem installed
- ✅ Flutter project structure created
- ✅ Android package ID: `com.example.sports_app_hackatum`
- ✅ iOS bundle ID: `com.example.sportsAppHackatum`
- ✅ Dependencies installed

## 🔧 What You Need to Do

### 1. Complete Firebase Setup in Console

Go to [Firebase Console](https://console.firebase.google.com/) and:

1. **Select/Import your project** `hackatumsportsapp`
2. **Enable Authentication**:
   - Go to Authentication → Get started
   - Enable Email/Password sign-in method
3. **Create Firestore Database**:
   - Go to Firestore Database → Create database
   - Start in test mode
   - Choose location (e.g., `europe-west3` for Munich)

### 2. Add Android App

1. In Firebase Console, click **Android icon** (or "Add app")
2. **Package name**: `com.example.sports_app_hackatum`
3. **App nickname**: "Sports Munich Android" (optional)
4. Click **Register app**
5. Download `google-services.json`
6. Replace the existing file at: `android/app/google-services.json`

### 3. Add iOS App

1. In Firebase Console, click **iOS icon** (or "Add app")
2. **Bundle ID**: `com.example.sportsAppHackatum`
3. **App nickname**: "Sports Munich iOS" (optional)
4. Click **Register app**
5. Download `GoogleService-Info.plist`
6. Place it in: `ios/Runner/GoogleService-Info.plist`

### 4. Run FlutterFire Configure

After adding both apps in Firebase Console:

```bash
flutterfire configure
```

When prompted:
- Select project: `hackatumsportsapp`
- Select platforms: Both Android and iOS
- It will generate `lib/common/firebase_options.dart` with real values

### 5. Add Location Permissions

#### Android
Edit `android/app/src/main/AndroidManifest.xml` and add inside `<manifest>`:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
```

#### iOS
Edit `ios/Runner/Info.plist` and add before `</dict>`:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>We need your location to show nearby events</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>We need your location to show nearby events</string>
```

### 6. Test the App

```bash
flutter run
```

## Package/Bundle IDs Reference

- **Android**: `com.example.sports_app_hackatum`
- **iOS**: `com.example.sportsAppHackatum`

Make sure these match exactly when adding apps in Firebase Console!

