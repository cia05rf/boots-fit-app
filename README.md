# Boots Fit - React Native App

A React Native app built with Expo for health and fitness tracking using Android Health Connect.

## Project Information

- **App Name**: Boots Fit
- **Version**: 1.0.0
- **Bundle ID**: com.bootsdsinno.bootsfit
- **Platform**: Android (with iOS support)
- **Framework**: React Native 0.79.6 with Expo SDK 53
- **Language**: TypeScript

## Prerequisites

- Node.js installed
- Android phone with USB debugging enabled
- USB cable to connect phone to computer
- Android SDK (for ADB commands)
- EAS CLI (for development builds)

## Phone Setup (Required)

1. **Enable Developer Options:**
   - Go to Settings → About Phone
   - Tap "Build Number" 7 times
   - Developer Options will be enabled

2. **Enable USB Debugging:**
   - Go to Settings → Developer Options
   - Enable "USB Debugging"
   - Enable "Install via USB" (if available)

3. **Set USB Connection Mode:**
   - Connect phone to computer via USB cable
   - On your phone, pull down the notification panel
   - Tap on "USB" or "Charging this device via USB"
   - Select "File Transfer" or "MTP" mode
   - Allow USB debugging when prompted on phone

4. **Verify USB Connection:**
   - Open Command Prompt/Terminal
   - Run: `adb devices`
   - You should see your device listed (e.g., "ABC123 device")
   - If not listed, check USB cable and try different USB port

## Running the App

### 1. Install Dependencies
```bash
npm install
```

### 2. Install EAS CLI (if not already installed)
```bash
npm install -g eas-cli
```

### 3. Login to Expo (First Time Only)
```bash
eas login
```

### 4. Build Development Client (First Time Only)
```bash
eas build --platform android --profile development
```
- Download the APK from the provided link
- Install it on your phone
- The app will appear as "Boots Fit" on your phone

### 5. Set up ADB Port Forwarding
```bash
adb reverse tcp:8081 tcp:8081
```

### 6. Start the Development Server
```bash
npx expo start --dev-client --host localhost
```

### 7. Connect Your Phone
- Open the "Boots Fit" app on your phone
- The app will automatically connect to your development server
- Changes will sync automatically as you develop

## Development

- Make changes to `App.tsx` or other files
- Changes will automatically sync to your phone
- No need to rebuild for code changes

## Available Scripts

```bash
npm start          # Start Expo development server
npm run android    # Run on Android device/emulator
npm run ios        # Run on iOS simulator
npm run web        # Run on web browser
```

## Dependencies

### Core Dependencies
- **expo**: ~53.0.22 - Expo SDK
- **react**: 19.0.0 - React framework
- **react-native**: 0.79.6 - React Native framework
- **expo-dev-client**: ~5.2.4 - Development client
- **react-native-health-connect**: ^3.3.3 - Android Health Connect integration
- **firebase**: ^12.2.1 - Firebase services

### Development Dependencies
- **typescript**: ~5.8.3 - TypeScript support
- **@types/react**: ~19.0.10 - React TypeScript definitions

## Android Permissions

The app requires the following Android Health Connect permissions:
- `android.permission.health.READ_STEPS`
- `android.permission.health.WRITE_STEPS`
- `android.permission.health.READ_HEART_RATE`
- `android.permission.health.READ_SLEEP`
- `android.permission.health.READ_WEIGHT`

## Build Configuration

- **Minimum SDK**: 26 (Android 8.0)
- **Target SDK**: 34 (Android 14)
- **Compile SDK**: 34
- **Orientation**: Portrait only
- **Bundle ID**: com.bootsdsinno.bootsfit

## Troubleshooting

- **App not connecting:** Make sure ADB port forwarding is set up
- **Network issues:** Try `npx expo start --dev-client --tunnel` instead
- **Build issues:** Ensure your phone is in Developer Mode with USB debugging enabled
- **Health Connect not working:** Make sure you have the development build installed, not Expo Go
- **ADB not found:** Install Android SDK Platform Tools

## Features

- Health Connect integration for Android
- Step tracking
- Heart rate monitoring
- Sleep tracking
- Weight tracking
- Firebase integration
- TypeScript support
