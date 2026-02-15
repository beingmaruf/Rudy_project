
# 📍 Google Maps Setup – Flutter (Android + iOS)

## 🎯 Purpose

This document explains how Google Maps is configured in this project and how to avoid the **“blank map in release APK”** issue.

---

# 🧩 Architecture Overview

| Layer                 | Purpose                                 |
| --------------------- | --------------------------------------- |
| `.env`                | Stores API key                          |
| `build.gradle.kts`    | Injects API key into AndroidManifest    |
| `AndroidManifest.xml` | Google Maps SDK reads API key from here |
| `AppDelegate.swift`   | iOS Google Maps key setup               |

---

# 🔐 Environment File

### Location

```
<PROJECT_ROOT>/.env
```

### Content

```
GOOGLE_MAPS_API_KEY=YOUR_REAL_KEY
```

---

# 🤖 Android Setup

## 1️⃣ AndroidManifest.xml

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="${GOOGLE_MAPS_API_KEY}" />
```

⚠️ Google Maps SDK reads the key **only from here**.

---

## 2️⃣ build.gradle.kts (android/app)

```kotlin
val envFile = File(project.rootDir.parentFile, ".env")
val googleMapsApiKey = if (envFile.exists()) {
    val envProps = Properties()
    envProps.load(envFile.inputStream())
    envProps.getProperty("GOOGLE_MAPS_API_KEY", "")
} else {
    ""
}

manifestPlaceholders["GOOGLE_MAPS_API_KEY"] = googleMapsApiKey
```

This injects the key into the manifest during build.

---

## 3️⃣ Build Commands

### Debug

```bash
flutter run
```

### Release (for physical device testing)

```bash
flutter run --release
```

### Release APK

```bash
flutter build apk --release
```

APK location:

```
build/app/outputs/flutter-apk/app-release.apk
```

---

# 🧪 How to Verify Key Injection

1. Open Android Studio
2. Build → Analyze APK
3. Open `AndroidManifest.xml`
4. Confirm:

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="AIzaSyXXXXXX" />
```

If empty → map will be blank.

---

# 🍎 iOS Setup

In `AppDelegate.swift`:

```swift
let apiKey = Bundle.main.infoDictionary?["GOOGLE_MAPS_API_KEY"] as? String ?? ""
GMSServices.provideAPIKey(apiKey)
```

Add to `Info.plist`:

```xml
<key>GOOGLE_MAPS_API_KEY</key>
<string>YOUR_KEY</string>
```

---

# ⚠️ Common Problems & Fixes

## ❌ Blank Map in Release Only

Cause:

* API key not injected into release manifest

Fix:

* Check merged manifest in APK
* Ensure `.env` exists during build
* Run `flutter clean`

---

## ❌ Works in Emulator but Not on Device

Possible causes:

* Google Play services outdated
* Wrong installed APK
* Old cached build
* Device without GMS (Huawei)

Fix:

```bash
flutter clean
flutter run --release
```

---

## ❌ `--dart-define` Not Working

`--dart-define` is **Dart-only**.

Google Maps Android SDK does NOT read Dart environment variables.

---

# 🛡 Production Notes

Before Play Store release:

* Enable Billing in Google Cloud
* Restrict API key by:

  * Package name
  * SHA-1 (release keystore)
* Use real release signing config (not debug signing)

---

# 🚀 Final Status

✔ API key injected via Gradle
✔ Manifest verified
✔ Release build tested on physical device
✔ Google Play services confirmed

Google Maps rendering correctly in release mode.

