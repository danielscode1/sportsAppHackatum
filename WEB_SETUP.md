# Running Flutter App in LibreWolf (or any browser)

## Option 1: Web Server Mode (Recommended)

Run Flutter in web-server mode, then open the URL in LibreWolf:

```bash
flutter run -d web-server
```

This will start a local web server and display a URL like:
```
http://localhost:xxxxx
```

Then manually open that URL in LibreWolf.

## Option 2: Set Browser Executable

If you want Flutter to automatically open LibreWolf, you can set the CHROME_EXECUTABLE environment variable:

```bash
# Find LibreWolf path
find /Applications -name "LibreWolf.app" -type d

# Then set it (replace with actual path)
export CHROME_EXECUTABLE="/Applications/LibreWolf.app/Contents/MacOS/librewolf"

# Then run
flutter run -d chrome
```

Note: Flutter might still call it "chrome" but it will use LibreWolf.

## Option 3: Use Flutter's Web Server Directly

```bash
# Build for web
flutter build web

# Serve the build
cd build/web
python3 -m http.server 8000
# Or use any other local server

# Open http://localhost:8000 in LibreWolf
```

## Quick Command

The simplest way:

```bash
flutter run -d web-server
```

Then copy the URL from the terminal and paste it into LibreWolf.

