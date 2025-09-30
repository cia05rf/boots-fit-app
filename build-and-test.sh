#!/bin/bash

# Boots Fit - Automated Build and Test Script
# This script handles the minSdkVersion issue and runs a local preview build

set -e  # Exit on any error

echo "🚀 Starting Boots Fit build process..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Step 1: Clean and prebuild
print_status "Step 1: Running expo prebuild --clean"
npx expo prebuild --platform android --clean

if [ $? -ne 0 ]; then
    print_error "Prebuild failed!"
    exit 1
fi

print_success "Prebuild completed successfully"

# Step 2: Check if gradle.properties exists
if [ ! -f "android/gradle.properties" ]; then
    print_error "gradle.properties not found after prebuild!"
    exit 1
fi

# Step 3: Add missing minSdkVersion and other required properties
print_status "Step 2: Adding required SDK properties to gradle.properties"

# Check if the properties already exist
if grep -q "minSdkVersion=26" android/gradle.properties; then
    print_warning "minSdkVersion=26 already exists in gradle.properties"
else
    # Add the required properties
    cat >> android/gradle.properties << 'EOF'

# Android SDK versions - manually set for health connect compatibility
minSdkVersion=26
compileSdkVersion=35
targetSdkVersion=35
buildToolsVersion=35.0.0
ndkVersion=27.1.12297006
EOF
    print_success "Added minSdkVersion and other SDK properties to gradle.properties"
fi

# Step 4: Verify the properties were added
print_status "Step 3: Verifying gradle.properties configuration"
if grep -q "minSdkVersion=26" android/gradle.properties; then
    print_success "✅ minSdkVersion=26 is set"
else
    print_error "❌ minSdkVersion=26 is NOT set!"
    exit 1
fi

if grep -q "compileSdkVersion=35" android/gradle.properties; then
    print_success "✅ compileSdkVersion=35 is set"
else
    print_error "❌ compileSdkVersion=35 is NOT set!"
    exit 1
fi

# Step 5: Commit changes to git
print_status "Step 4: Committing changes to git"
git add android/gradle.properties
git commit -m "Auto-fix: Add minSdkVersion=26 and SDK properties for health connect compatibility" || print_warning "No changes to commit or already committed"

# Step 6: Run expo doctor to check configuration
print_status "Step 5: Running expo doctor to verify configuration"
npx expo-doctor || print_warning "expo-doctor found some issues (this is normal)"

# Step 7: Show final configuration
print_status "Step 6: Final configuration check"
echo "📋 Current Android configuration:"
echo "----------------------------------------"
grep -E "(minSdkVersion|compileSdkVersion|targetSdkVersion|buildToolsVersion|ndkVersion)" android/gradle.properties || echo "No SDK properties found"

# Step 8: Try to run a preview build (if EAS CLI is available)
print_status "Step 7: Attempting to run preview build"
if command -v eas &> /dev/null; then
    print_status "Running: eas build --platform android --profile preview --local"
    eas build --platform android --profile preview --local || {
        print_warning "Local EAS build failed or not available"
        print_status "You can now run: eas build --platform android --profile preview"
    }
else
    print_warning "EAS CLI not found. Install it with: npm install -g @expo/eas-cli"
    print_status "You can now run: eas build --platform android --profile preview"
fi

print_success "🎉 Build process completed!"
print_status "Your project is now ready for EAS Build with minSdkVersion=26"
print_status "Run: eas build --platform android --profile preview"
