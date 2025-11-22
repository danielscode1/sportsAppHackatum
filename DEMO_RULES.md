# Demo Rules - Allow Everything (Development/Demo Only)

## ⚠️ WARNING
These rules allow **ANYONE** (even without authentication) to read and write everything. 
**ONLY USE FOR DEMOS/TESTING. NEVER USE IN PRODUCTION!**

## Firebase Storage Rules

1. Go to Firebase Console → Storage → Rules
2. Replace with:

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read, write: if true;
    }
  }
}
```

3. Click **Publish**

## Firestore Rules

1. Go to Firebase Console → Firestore Database → Rules
2. Replace with:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
```

3. Click **Publish**

## That's It!

After publishing both sets of rules:
- Refresh your browser
- Everything should work without authentication issues
- Anyone can read/write everything (perfect for demos)

## After Your Demo

Remember to change these back to proper security rules before going to production!

