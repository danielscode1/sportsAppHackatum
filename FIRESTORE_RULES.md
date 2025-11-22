# Firestore Security Rules Fix

## The Problem
You're getting a `permission-denied` error when trying to create events. This is because Firestore security rules are blocking the write operation.

## The Solution

You need to update your Firestore security rules to allow authenticated users to create and manage events.

### Steps:

1. **Go to Firebase Console:**
   - Visit https://console.firebase.google.com/
   - Select your project: `hackatumsportsapp-d4582`

2. **Navigate to Firestore:**
   - Click on "Firestore Database" in the left sidebar
   - Click on the "Rules" tab

3. **Update the Rules:**
   Replace the existing rules with:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users collection - users can read any user, but only update their own
    match /users/{userId} {
      allow read: if request.auth != null;
      allow create: if request.auth != null && request.auth.uid == userId;
      allow update: if request.auth != null && request.auth.uid == userId;
      allow delete: if false; // Prevent deletion
    }
    
    // Events collection
    match /events/{eventId} {
      // Anyone authenticated can read events
      allow read: if request.auth != null;
      
      // Anyone authenticated can create events
      allow create: if request.auth != null;
      
      // Only the host can update/delete their event
      allow update: if request.auth != null && 
                       request.auth.uid == resource.data.hostId;
      allow delete: if request.auth != null && 
                       request.auth.uid == resource.data.hostId;
      
      // Event attendees subcollection
      match /attendees/{attendeeId} {
        allow read: if request.auth != null;
        allow create: if request.auth != null;
        allow update: if false;
        allow delete: if request.auth != null && 
                         (request.auth.uid == attendeeId || 
                          request.auth.uid == get(/databases/$(database)/documents/events/$(eventId)).data.hostId);
      }
      
      // Event requests subcollection (for invite-only events)
      match /requests/{requestId} {
        allow read: if request.auth != null && 
                       (request.auth.uid == requestId || 
                        request.auth.uid == get(/databases/$(database)/documents/events/$(eventId)).data.hostId);
        allow create: if request.auth != null && request.auth.uid == requestId;
        allow update: if false;
        allow delete: if request.auth != null && 
                         (request.auth.uid == requestId || 
                          request.auth.uid == get(/databases/$(database)/documents/events/$(eventId)).data.hostId);
      }
      
      // Event chat subcollection
      match /chat/{messageId} {
        allow read: if request.auth != null;
        allow create: if request.auth != null;
        allow update: if false;
        allow delete: if request.auth != null && 
                         request.auth.uid == resource.data.senderId;
      }
    }
  }
}
```

4. **Publish the Rules:**
   - Click "Publish" button
   - Wait a few seconds for the rules to propagate

5. **Test Again:**
   - Try creating an event again
   - Make sure you're logged in to the app

## Alternative: Development Rules (Less Secure)

If you want simpler rules for development/testing (allows all authenticated users to do anything):

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

⚠️ **Warning:** The alternative rules are less secure. Use them only for development/testing, not in production.

## Why This Happens

Firestore requires security rules to prevent unauthorized access. When rules are too restrictive or missing, operations are blocked with a `permission-denied` error.

## After Fixing

Once you update the rules:
1. Refresh your app
2. Make sure you're logged in
3. Try creating an event again

The event creation should work now!

