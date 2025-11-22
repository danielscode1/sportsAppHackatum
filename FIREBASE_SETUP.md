# Firebase Setup Guide

## Option 1: Create Firebase Project via Web Console (Recommended)

### Step 1: Create Project in Firebase Console

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click **"Add project"** or **"Create a project"**
3. Enter a project name (e.g., "sports-munich" or "sports-app-hackatum")
4. **Project ID** will be auto-generated (or you can customize it)
   - Must be unique globally
   - Can contain lowercase letters, numbers, and hyphens
   - Must be at least 6 characters
   - Example: `sports-munich-2024` or `hackatum-sports-app`
5. Click **Continue**
6. (Optional) Enable Google Analytics - you can skip this for MVP
7. Click **Create project**
8. Wait for project creation to complete
9. Click **Continue**

### Step 2: Add Apps to Your Project

#### For Android:
1. In Firebase Console, click the **Android icon** (or "Add app")
2. **Android package name**: Use the default from your Flutter app
   - Usually: `com.example.sports_app_hackatum` or similar
   - You can find this in `android/app/build.gradle` (applicationId)
3. **App nickname** (optional): "Sports Munich Android"
4. **Debug signing certificate SHA-1** (optional for MVP)
5. Click **Register app**
6. Download `google-services.json`
7. Place it in `android/app/` directory

#### For iOS:
1. Click the **iOS icon** (or "Add app")
2. **iOS bundle ID**: Use the default from your Flutter app
   - Usually: `com.example.sportsAppHackatum` or similar
   - You can find this in `ios/Runner.xcodeproj` or `ios/Runner/Info.plist`
3. **App nickname** (optional): "Sports Munich iOS"
4. Click **Register app**
5. Download `GoogleService-Info.plist`
6. Place it in `ios/Runner/` directory

### Step 3: Enable Firebase Services

1. **Authentication**:
   - Go to **Authentication** → **Get started**
   - Click **Sign-in method** tab
   - Enable **Email/Password**
   - Click **Save**

2. **Firestore Database**:
   - Go to **Firestore Database** → **Create database**
   - Choose **Start in test mode** (for development)
   - Select a location (choose closest to Munich, e.g., `europe-west3`)
   - Click **Enable**

3. **Storage** (Optional for MVP):
   - Go to **Storage** → **Get started**
   - Start in test mode
   - Choose location

4. **Cloud Messaging** (Optional for MVP):
   - Already enabled by default

### Step 4: Run FlutterFire Configure

Now that you have a Firebase project:

```bash
# Make sure you're logged in
firebase login

# Run flutterfire configure
flutterfire configure
```

When prompted:
- Select your existing Firebase project (the one you just created)
- Select platforms (Android, iOS, or both)
- It will automatically generate `lib/common/firebase_options.dart`

## Option 2: Use Firebase CLI (Alternative)

If you prefer using CLI:

```bash
# Login to Firebase
firebase login

# List your projects (should show the one you created)
firebase projects:list

# Create a new project via CLI (if you want)
firebase projects:create sports-munich-app --display-name "Sports Munich App"
```

**Note**: Project IDs must be:
- Globally unique
- At least 6 characters
- Lowercase letters, numbers, hyphens only
- Cannot start/end with hyphen

Then run:
```bash
flutterfire configure
```

## Troubleshooting

### "Found 0 Firebase projects"
- Make sure you're logged in: `firebase login`
- Check you're using the correct Google account
- Create a project via web console first (Option 1 is easier)

### "Failed to create project"
- Project ID might be too short or invalid
- Project ID might already be taken
- Use the web console instead (more reliable)

### "Project ID must be at least 6 characters"
- Use a longer, descriptive name like `sports-munich-2024`

### After flutterfire configure, still getting errors
- Make sure `google-services.json` is in `android/app/`
- Make sure `GoogleService-Info.plist` is in `ios/Runner/`
- Run `flutter clean` and `flutter pub get`
- Make sure Firebase services are enabled in console

## Quick Checklist

- [ ] Firebase project created in console
- [ ] Android app added (google-services.json downloaded)
- [ ] iOS app added (GoogleService-Info.plist downloaded)
- [ ] Authentication enabled (Email/Password)
- [ ] Firestore Database created
- [ ] `flutterfire configure` completed successfully
- [ ] `firebase_options.dart` generated in `lib/common/`
- [ ] `flutter pub get` run successfully
- [ ] App runs without Firebase errors

