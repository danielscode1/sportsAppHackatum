# Troubleshooting White Screen on Web

## Most Likely Cause: Firebase Not Configured

The white screen is almost certainly because **Firebase hasn't been configured yet**. The `firebase_options.dart` file still has placeholder values, which causes Firebase initialization to fail silently.

## Quick Check

1. **Open browser console** (F12 or right-click → Inspect → Console)
2. Look for errors like:
   - `FirebaseError`
   - `Invalid API key`
   - `Firebase: No Firebase App '[DEFAULT]' has been created`

## Solution

You need to complete Firebase setup:

1. **Run `flutterfire configure`** (after setting up Firebase in console)
2. This will generate proper `firebase_options.dart` with real values
3. Then rebuild: `flutter build web` or `flutter run -d web-server`

## Alternative: Run on iOS (Easier for Testing)

Yes, you can run on iOS on your Mac! You need:

1. **CocoaPods** (iOS dependency manager):
   ```bash
   sudo gem install cocoapods
   ```

2. **Install iOS dependencies**:
   ```bash
   cd ios
   pod install
   cd ..
   ```

3. **Run on iOS Simulator**:
   ```bash
   # List available simulators
   flutter emulators
   
   # Or run directly (will open simulator)
   flutter run -d ios
   ```

## Check Browser Console

To see what's actually wrong:

1. Open the web page in LibreWolf
2. Press **F12** (or right-click → Inspect Element)
3. Go to **Console** tab
4. Look for red error messages
5. Share those errors - they'll tell us exactly what's wrong

## Quick Test Without Firebase

If you want to test the UI without Firebase, we can temporarily disable Firebase initialization, but you'll need Firebase for the app to work properly.

