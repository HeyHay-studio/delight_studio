#!/bin/bash
set -e # Exit on error
set -x # Print commands (for debugging)

# 1. Setup Flutter SDK
if [ ! -d "flutter" ]; then
  echo ">>> Downloading Flutter SDK..."
  git clone https://github.com/flutter/flutter.git -b stable --depth 1
fi

export PATH="$PATH:$(pwd)/flutter/bin"

# 2. Diagnostic: Check environment
echo ">>> Environment Check:"
flutter --version
which flutter

# 3. Clean and get dependencies (Ensures fresh state)
echo ">>> Preparing project..."
flutter pub get

# 4. Build for Web
echo ">>> Starting Build..."
flutter build web --release --base-href "/"

# 5. Verification: List output to ensure files exist
echo ">>> Verifying build output..."
if [ -d "build/web" ]; then
  ls -la build/web
  echo ">>> Build successfully generated in build/web"
else
  echo ">>> ERROR: build/web directory not found!"
  exit 1
fi
