#!/bin/bash

# 1. Optimization: Use a shallow clone for faster setup
if [ ! -d "flutter" ]; then
  echo ">>> Downloading Flutter SDK (Stable Channel)..."
  git clone https://github.com/flutter/flutter.git -b stable --depth 1
fi

# 2. Add Flutter to PATH for this session
export PATH="$PATH:$(pwd)/flutter/bin"

# 3. Pre-load dependencies and verify
echo ">>> Running Flutter Doctor..."
flutter doctor

# 4. Build the Web Application
echo ">>> Building Production Web Bundle..."
flutter build web --release --base-href "/"

echo ">>> Build Complete. Assets are in build/web"
