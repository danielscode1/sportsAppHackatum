# Sports Munich - Flutter MVP

A mobile Flutter app for organizing spontaneous sports events with strangers in Munich.

## Features

- **Map-based interface** using OpenStreetMap
- **Create events** on the map with pin placement
- **Join/Leave events** and see attendee counts
- **Real-time chat** for each event
- **Event list view** with filtering by sport type
- **User authentication** with email/password
- **Settings** with dark mode, history, and profile management

## Tech Stack

- **Flutter** with Dart
- **Riverpod** for state management
- **Firebase** (Authentication, Firestore, Storage, FCM)
- **OpenStreetMap** via `flutter_map`
- **Geolocator** for location services

## Setup Instructions

### 1. Prerequisites

- Flutter SDK (>=3.0.0)
- Firebase project created
- Android Studio / Xcode for mobile development

### 2. Firebase Setup

**⚠️ Important**: You need to create a Firebase project first via the [Firebase Console](https://console.firebase.google.com/) before running `flutterfire configure`.

**See (DOESNT EXIST) [FIREBASE_SETUP.md](FIREBASE_SETUP.md) for detailed step-by-step instructions.**

Quick steps:

1. Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/) Firebase will guide you through the following steps:
2. Install FlutterFire CLI:
   ```bash
   dart pub global activate flutterfire_cli
   ```
3. Login to Firebase:
   ```bash
   firebase login
   ```
4. Configure Firebase for your project:

   ```bash
   flutterfire configure
   ```

   This will generate the `firebase_options.dart` file with your Firebase credentials.

5. Enable the following Firebase services:

   - Authentication (Email/Password)
   - Cloud Firestore
   - Firebase Storage (optional for MVP)
   - Firebase Cloud Messaging (optional for MVP)

6. Set up Firestore security rules (for development):
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

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Platform-Specific Setup

#### Android

1. Add location permissions to `android/app/src/main/AndroidManifest.xml`:

   ```xml
   <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
   <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
   ```

2. Add internet permission (if not already present):
   ```xml
   <uses-permission android:name="android.permission.INTERNET" />
   ```

#### iOS

1. Add location permissions to `ios/Runner/Info.plist`:
   ```xml
   <key>NSLocationWhenInUseUsageDescription</key>
   <string>We need your location to show nearby events</string>
   <key>NSLocationAlwaysUsageDescription</key>
   <string>We need your location to show nearby events</string>
   ```

### 5. Run the App

```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── app.dart                  # Root widget with theme and routing
├── common/
│   ├── firebase_options.dart # Firebase configuration (generated)
│   ├── theme/
│   │   └── app_theme.dart    # Light/dark theme definitions
│   ├── models/               # Data models (User, Event, ChatMessage)
│   └── repositories/         # Firebase repositories
├── features/
│   ├── auth/                 # Authentication
│   │   ├── providers/        # Auth state providers
│   │   └── screens/          # Login/signup screens
│   ├── map/                  # Map screen
│   │   ├── providers/        # Map state providers
│   │   └── screens/          # Map screen with markers
│   ├── events/               # Event management
│   │   └── screens/          # Event creation, list view
│   ├── chats/                # Chat functionality
│   │   └── screens/          # Chat list, chat screen
│   └── settings/             # Settings screen
│       └── screens/          # Settings, profile, history
```

## Data Model

### Firestore Collections

- `users/{userId}` - User profiles
- `events/{eventId}` - Sports events
- `events/{eventId}/attendees/{userId}` - Event attendees
- `events/{eventId}/chat/{messageId}` - Chat messages

## Development Notes

- The app uses Riverpod for state management
- All Firestore operations are abstracted through repository classes
- Real-time updates are handled via Firestore streams
- Location permissions are requested on first map load
- Dark mode preference is stored in user profile

## Next Steps

- Add profile image upload to Firebase Storage
- Implement push notifications via FCM
- Add event filtering by date/time
- Improve map clustering for many events
- Add event search functionality
- Implement user ratings/reviews
