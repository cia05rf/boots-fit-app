#!/bin/bash

# Quick fix for minSdkVersion issue
# Run this after any expo prebuild --clean

set -e

echo "🔧 Fixing minSdkVersion configuration..."

# Add required properties to gradle.properties
cat >> android/gradle.properties << 'EOF'

# Android SDK versions - manually set for health connect compatibility
minSdkVersion=26
compileSdkVersion=35
targetSdkVersion=35
buildToolsVersion=35.0.0
ndkVersion=27.1.12297006
EOF

# Also add to root build.gradle to ensure they're available as ext properties
if ! grep -q "ext {" android/build.gradle; then
    cat >> android/build.gradle << 'EOF'

// Define SDK versions for health connect compatibility
ext {
    minSdkVersion = 26
    compileSdkVersion = 35
    targetSdkVersion = 35
    buildToolsVersion = "35.0.0"
    ndkVersion = "27.1.12297006"
}
EOF
    echo "✅ Added ext properties to root build.gradle"
fi

echo "✅ Added minSdkVersion=26 and other SDK properties"
echo "📋 Current gradle.properties SDK settings:"
grep -E "(minSdkVersion|compileSdkVersion|targetSdkVersion|buildToolsVersion|ndkVersion)" android/gradle.properties

echo "🎉 Ready for EAS Build!"
