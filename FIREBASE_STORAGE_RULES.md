# Firebase Storage Security Rules Fix

## The Problem
You're getting a CORS error when trying to upload images. This is because Firebase Storage security rules are blocking the upload request. The error "Response to preflight request doesn't pass access control check" means the OPTIONS request is being rejected.

## The Solution

You **MUST** update your Firebase Storage security rules. This is the only way to fix the CORS error.

### Step-by-Step Instructions:

1. **Go to Firebase Console:**
   - Visit https://console.firebase.google.com/
   - Select your project: `hackatumsportsapp-d4582`

2. **Navigate to Storage:**
   - Click on **"Storage"** in the left sidebar (under "Build")
   - Click on the **"Rules"** tab at the top

3. **IMPORTANT: Check Current Rules**
   - Look at what's currently there
   - If you see rules that say `allow read, write: if false;` or similar restrictive rules, that's the problem

4. **Replace ALL Rules with This:**
   
   **Copy and paste this EXACT code:**

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    // Allow authenticated users to read/write event images
    match /event_images/{eventId}/{allPaths=**} {
      allow read: if request.auth != null;
      allow write: if request.auth != null;
    }
    
    // Allow authenticated users to read/write profile images
    match /profile_images/{allPaths=**} {
      allow read: if request.auth != null;
      allow write: if request.auth != null;
    }
    
    // Deny all other access
    match /{allPaths=**} {
      allow read, write: if false;
    }
  }
}
```

5. **Publish the Rules:**
   - Click the **"Publish"** button (usually at the top right)
   - Wait 10-30 seconds for the rules to propagate

6. **Verify Rules Are Published:**
   - You should see a success message
   - The rules should show the new code you pasted

7. **Test Again:**
   - **Refresh your browser** (important!)
   - Make sure you're **logged in** to the app
   - Try uploading an image again

## Alternative: Simple Development Rules (If Above Doesn't Work)

If the above rules still don't work, try this simpler version for development:

```javascript
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read, write: if request.auth != null;
    }
  }
}
```

⚠️ **Warning:** This allows authenticated users to upload anywhere. Use only for development/testing.

## Common Issues:

1. **Rules not published:** Make sure you clicked "Publish" after pasting the rules
2. **Not logged in:** Make sure you're authenticated in the app
3. **Browser cache:** Try a hard refresh (Ctrl+Shift+R or Cmd+Shift+R)
4. **Wrong project:** Make sure you're editing rules for `hackatumsportsapp-d4582`

## Why This Happens

Firebase Storage requires security rules. When rules are too restrictive or reject requests, the browser's CORS policy blocks the upload because the preflight OPTIONS request fails with a non-200 status.

## Still Not Working?

If you've followed all steps and it still doesn't work:
1. Double-check you're in the correct Firebase project
2. Verify the rules were published (check the timestamp)
3. Try the simple development rules above
4. Check browser console for any other errors
5. Make sure Firebase Storage is enabled in your project

