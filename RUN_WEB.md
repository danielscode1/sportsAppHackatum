# How to Run Flutter Web App

## Option 1: Use Flutter's Built-in Web Server (Easiest)

After building, you can use Flutter's web server:

```bash
flutter run -d web-server --web-port=8080
```

This will:
- Compile the app
- Start a local web server
- Show you a URL like `http://localhost:8080`
- Open that URL in your browser (or copy it to LibreWolf)

## Option 2: Serve the Built Files Directly

If you've already run `flutter build web`, serve the `build/web` directory:

### Using Python (if installed):
```bash
cd build/web
python3 -m http.server 8080
```

Then open `http://localhost:8080` in LibreWolf.

### Using Node.js (if installed):
```bash
cd build/web
npx http-server -p 8080
```

### Using PHP (if installed):
```bash
cd build/web
php -S localhost:8080
```

## Option 3: Just Use `flutter run` (No Build Needed)

You don't need to build first! Just run:

```bash
flutter run -d web-server
```

Flutter will compile and serve automatically.

## Recommended Command

For your setup with LibreWolf, use:

```bash
flutter run -d web-server --web-port=8080
```

Then:
1. Wait for compilation to finish
2. Look for the URL in the terminal (e.g., `http://localhost:8080`)
3. Copy that URL and open it in LibreWolf

## Quick Start

```bash
# Just run this - no build needed!
flutter run -d web-server --web-port=8080
```

The app will compile, start a server, and show you the URL to open in your browser.

