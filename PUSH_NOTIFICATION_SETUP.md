# Push Notification Setup Guide for Flutter

Complete step-by-step guide to implement Firebase Cloud Messaging (FCM) with local notifications in any Flutter project.

---

## 📋 Prerequisites

- Flutter project with Firebase configured
- `firebase_options.dart` with Android & iOS configurations
- Android API level 21+ (minSdk)
- iOS 11+

---

## 🚀 Step 1: Add Dependencies

```bash
flutter pub add firebase_core firebase_messaging flutter_local_notifications flutter_dotenv
```

**pubspec.yaml** should include:
```yaml
dependencies:
  firebase_core: ^4.4.0
  firebase_messaging: ^16.1.1
  flutter_local_notifications: ^20.1.0
  flutter_dotenv: ^6.0.0
  get: ^4.6.6  # or your state management solution
```

---

## 🔧 Step 2: Android Configuration

### Enable Core Library Desugaring

**File:** `android/app/build.gradle.kts`

```kotlin
android {
    // ... existing config ...
    
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        isCoreLibraryDesugaringEnabled = true  // ← ADD THIS
    }
}

// Add at the end (before flutter block)
dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}

flutter {
    source = "../.."
}
```

---

## 📁 Step 3: Create Service Files

### 3.1 LocalNotificationService

**File:** `lib/core/services/fcm/local_notification_service.dart`

```dart
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/core/services/logger_service.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';

/// Local notification service using flutter_local_notifications.
/// Handles foreground notifications when the app is active.
class LocalNotificationService {
  static final LocalNotificationService _instance =
      LocalNotificationService._internal();
  factory LocalNotificationService() => _instance;
  LocalNotificationService._internal();

  static LocalNotificationService get instance => _instance;

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  /// Initialize local notification service
  Future<void> init() async {
    if (_isInitialized) return;

    await _initializePlugin();
    _isInitialized = true;
    LoggerService.info('✅ Local Notification Service initialized');
  }

  /// Initialize flutter_local_notifications plugin
  Future<void> _initializePlugin() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _plugin.initialize(
      settings: initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Create high-importance Android notification channel
    await _createNotificationChannel();
  }

  /// Create Android notification channel
  Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
      playSound: true,
      enableVibration: true,
    );

    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  /// Handle notification tap
  void _onNotificationTapped(NotificationResponse response) {
    LoggerService.info('Notification tapped: ${response.payload}');
    Get.toNamed(RoutesName.notificationScreen);
  }

  /// Request notification permissions (Android 13+ / iOS)
  Future<bool> requestPermissions() async {
    final bool? androidResult = await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();

    final bool? iosResult = await _plugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    final bool isAllowed = androidResult ?? iosResult ?? false;

    if (isAllowed) {
      LoggerService.info('Local notification permission granted');
    } else {
      LoggerService.warning('Local notification permission denied');
    }
    return isAllowed;
  }

  /// Show local notification from an FCM [RemoteMessage] (foreground only)
  Future<void> showNotificationFromFCM(RemoteMessage message) async {
    try {
      final RemoteNotification? notification = message.notification;

      if (notification == null) {
        LoggerService.warning(
          'FCM notification payload is null — skipping local notification',
        );
        return;
      }

      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
        'high_importance_channel',
        'High Importance Notifications',
        channelDescription:
            'This channel is used for important notifications.',
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
        enableVibration: true,
        icon: '@mipmap/ic_launcher',
      );

      const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      const NotificationDetails platformDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      await _plugin.show(
        id: notification.hashCode,
        title: notification.title,
        body: notification.body,
        notificationDetails: platformDetails,
        payload: message.data.toString(),
      );

      LoggerService.info(
        'Foreground notification displayed: ${notification.title}',
      );
    } catch (e) {
      LoggerService.error('Error showing local notification', e);
    }
  }

  /// Show a custom local notification (not from FCM)
  Future<void> showNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    try {
      const AndroidNotificationDetails androidDetails =
          AndroidNotificationDetails(
        'high_importance_channel',
        'High Importance Notifications',
        channelDescription:
            'This channel is used for important notifications.',
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
        enableVibration: true,
        icon: '@mipmap/ic_launcher',
      );

      const DarwinNotificationDetails iosDetails = DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

      const NotificationDetails platformDetails = NotificationDetails(
        android: androidDetails,
        iOS: iosDetails,
      );

      await _plugin.show(
        id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
        title: title,
        body: body,
        notificationDetails: platformDetails,
        payload: payload,
      );

      LoggerService.info('Custom notification displayed: $title');
    } catch (e) {
      LoggerService.error('Error showing custom notification', e);
    }
  }
}
```

---

### 3.2 FcmService

**File:** `lib/core/services/fcm/fcm_service.dart`

```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/core/services/fcm/local_notification_service.dart';
import 'package:getx_mvvm/core/services/local_storage_service.dart';
import 'package:getx_mvvm/core/services/logger_service.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';

/// Top-level background message handler — must be a top-level function.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  LoggerService.info('Background message received: ${message.notification?.title}');
}

/// FCM Service — singleton that manages Firebase Cloud Messaging.
///
/// Responsibilities:
///   - Request notification permissions
///   - Obtain & refresh the FCM device token
///   - Listen for foreground, background, and terminated-state messages
///   - Show local notifications while the app is in the foreground
///   - Navigate to the correct screen when a notification is tapped
class FcmService {
  static final FcmService _instance = FcmService._internal();
  factory FcmService() => _instance;
  FcmService._internal();

  static FcmService get instance => _instance;

  bool _isInitialized = false;

  /// Initialize FCM service with listeners, permissions, and token retrieval.
  Future<void> init() async {
    try {
      if (_isInitialized) return;

      LoggerService.info('Initializing FCM Service');

      // Initialize local notifications (foreground display)
      await LocalNotificationService.instance.init();

      // Register the background handler
      FirebaseMessaging.onBackgroundMessage(
        firebaseMessagingBackgroundHandler,
      );

      // Request notification permissions
      await _requestPermissions();

      // Handle the message that launched the app from terminated state
      await _handleInitialMessage();

      // Set up foreground & background-tap listeners
      _setupMessageListeners();

      // Fetch the device token
      await getFcmToken();

      // Listen for token refreshes
      _listenToTokenRefresh();

      _isInitialized = true;
      LoggerService.info('✅ FCM Service initialized successfully');
    } catch (e) {
      LoggerService.error('Error initializing FCM Service', e);
    }
  }

  // ─── Listeners ──────────────────────────────────────────────

  void _setupMessageListeners() {
    // Foreground notifications → show via local notification plugin
    FirebaseMessaging.onMessage.listen(_handleForegroundNotification);

    // Background → user tapped the notification
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);
  }

  /// Check for a message that opened the app from a terminated state.
  Future<void> _handleInitialMessage() async {
    final RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      _handleNotificationTap(initialMessage);
    }
  }

  // ─── Foreground ─────────────────────────────────────────────

  Future<void> _handleForegroundNotification(RemoteMessage message) async {
    LoggerService.info('🔔 Foreground notification received');
    LoggerService.info('  Title : ${message.notification?.title}');
    LoggerService.info('  Body  : ${message.notification?.body}');
    LoggerService.info('  Data  : ${message.data}');

    // Check if user is logged in
    final String? accessToken = await LocalStorageService.getAccessToken();
    if (accessToken == null || accessToken.isEmpty) {
      LoggerService.info('User not logged in — skipping foreground notification');
      return;
    }

    // Show local notification
    await LocalNotificationService.instance.showNotificationFromFCM(message);
  }

  // ─── Tap / Open ─────────────────────────────────────────────

  Future<void> _handleNotificationTap(RemoteMessage message) async {
    LoggerService.info('🔔 Notification tapped');
    LoggerService.info('  Title : ${message.notification?.title}');
    LoggerService.info('  Data  : ${message.data}');

    final String? accessToken = await LocalStorageService.getAccessToken();

    // Delay briefly to let the navigation context settle
    Future.delayed(const Duration(milliseconds: 300), () {
      if (accessToken == null || accessToken.isEmpty) {
        LoggerService.info('User not logged in — redirecting to login');
        Get.toNamed(RoutesName.loginScreen);
        return;
      }

      // Default: navigate to the notification screen
      LoggerService.info('Navigating to notification screen');
      Get.toNamed(RoutesName.notificationScreen);
    });
  }

  // ─── Permissions ────────────────────────────────────────────

  Future<void> _requestPermissions() async {
    final NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Also request local notification permissions (Android 13+ / iOS)
    await LocalNotificationService.instance.requestPermissions();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      LoggerService.info('FCM notification permission granted');
    } else {
      LoggerService.warning('FCM notification permission denied');
    }
  }

  // ─── Token Management ───────────────────────────────────────

  /// Retrieve the current FCM device token.
  Future<String?> getFcmToken() async {
    try {
      if (Firebase.apps.isEmpty) {
        LoggerService.error('Firebase is not initialized');
        return null;
      }

      final String? token = await FirebaseMessaging.instance.getToken();
      if (token != null && token.isNotEmpty) {
        LoggerService.info('FCM Token obtained: $token');
        await LocalStorageService.saveFcmToken(token);
      } else {
        LoggerService.warning('FCM Token is null or empty');
      }
      return token;
    } catch (e) {
      LoggerService.error('Failed to get FCM token', e);
      return null;
    }
  }

  /// Listen for token refreshes and persist the new token.
  void _listenToTokenRefresh() {
    FirebaseMessaging.instance.onTokenRefresh.listen((String newToken) {
      LoggerService.info('FCM Token refreshed: $newToken');
      LocalStorageService.saveFcmToken(newToken);
    });
  }

  /// Delete FCM token — call on logout.
  Future<void> deleteFcmToken() async {
    try {
      await FirebaseMessaging.instance.deleteToken();
      await LocalStorageService.clearFcmToken();
      LoggerService.info('FCM token deleted successfully');
    } catch (e) {
      LoggerService.error('Failed to delete FCM token', e);
    }
  }
}
```

---

## 🔌 Step 4: Initialize in main.dart

**File:** `lib/main.dart`

```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:getx_mvvm/core/services/fcm/fcm_service.dart';
import 'package:getx_mvvm/core/services/local_storage_service.dart';
import 'package:getx_mvvm/core/services/logger_service.dart';
import 'package:getx_mvvm/firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: '.env');

  // Disable HTTP fetching for Google Fonts
  GoogleFonts.config.allowRuntimeFetching = true;

  await _initializeServices();
  runApp(const MyApp());
}

Future<void> _initializeServices() async {
  // Initialize logger service
  LoggerService.init();
  LoggerService.info('🚀 Application starting...');

  // Initialize local storage service
  await LocalStorageService.init();
  LoggerService.info('💾 Local storage initialized');

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  LoggerService.info('🔥 Firebase initialized');

  // Initialize FCM (push notifications)
  await FcmService.instance.init();
  LoggerService.info('🔔 FCM service initialized');

  // Initialize HTTP service
  LoggerService.info('🌐 HTTP service initialized');

  LoggerService.info('✅ All services initialized successfully');
}
```

---

## 🔐 Step 5: Integrate FCM Token in Login

**File:** `lib/features/common/auth/controller/login_controller.dart`

Add FCM import:
```dart
import 'package:getx_mvvm/core/services/fcm/fcm_service.dart';
```

Modify the login method to fetch and send the FCM token:
```dart
Future<void> loginApi() async {
  // ... validation code ...

  try {
    final networkClient = NetworkClient(fromLoginScreen: true);

    // Get FCM token to register this device for push notifications
    final fcmToken = await FcmService.instance.getFcmToken();

    final Map<String, dynamic> body = {
      'email': emailController.text.trim().toLowerCase(),
      'password': passwordController.text,
      if (fcmToken != null) 'fcmToken': fcmToken,
    };

    final response = await networkClient.postRequest(
      Urls.loginUrl,
      body: body,
      skipAuth: true,
    );

    // ... rest of login logic ...
  } catch (e) {
    // ... error handling ...
  }
}
```

---

## 💾 Step 6: Update LocalStorageService

Ensure these methods exist in your `LocalStorageService`:

```dart
// Save FCM token
static Future<void> saveFcmToken(String token) async {
  try {
    await _prefs?.setString(_keyFcmToken, token);
    LoggerService.info('💾 FCM token saved');
  } catch (e) {
    LoggerService.error('❌ Failed to save FCM token', e);
  }
}

// Get FCM token
static String? getFcmToken() {
  try {
    final token = _prefs?.getString(_keyFcmToken);
    LoggerService.info('📖 FCM token retrieved');
    return token;
  } catch (e) {
    LoggerService.error('❌ Failed to get FCM token', e);
    return null;
  }
}

// Clear FCM token
static Future<void> clearFcmToken() async {
  try {
    await _prefs?.remove(_keyFcmToken);
    LoggerService.info('🗑️ FCM token cleared');
  } catch (e) {
    LoggerService.error('❌ Failed to clear FCM token', e);
  }
}
```

---

## 🧪 Step 7: Build & Test

### Clean build:
```bash
flutter clean
flutter pub get
flutter run
```

### View FCM logs:
Look for these in the console:
```
✅ FCM Service initialized successfully
FCM Token obtained: <your_token>
```

---

## 🚀 Step 8: Send Test Notifications

### Via Firebase Console:

1. Go to **Firebase Console** → **Cloud Messaging**
2. Click **Create Campaign** → **Send Test Message**
3. Select **iOS** or **Android**
4. Enter the FCM token (from your app logs)
5. Add title & body
6. **Publish** and watch your app

### Expected Behavior:

| State | Behavior |
|-------|----------|
| **Foreground** | Local notification appears with custom sound/vibration |
| **Background** | Firebase handles it; tapping navigates to notification screen |
| **Terminated** | App launches; message is processed on startup |

---

## 📝 Customization

### Customize notification channel:

In `LocalNotificationService._createNotificationChannel()`:
```dart
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'your_channel_id',  // ← Change this
  'Your Channel Name',  // ← Change this
  description: 'Your description',  // ← Change this
  importance: Importance.high,
);
```

### Customize notification routing:

In `FcmService._handleNotificationTap()`:
```dart
// Parse custom data from message
final userId = message.data['userId'];
final type = message.data['type'];

// Route based on your app's logic
if (type == 'order') {
  Get.toNamed(RoutesName.orderDetailsScreen, arguments: {'id': userId});
} else {
  Get.toNamed(RoutesName.notificationScreen);
}
```

### Handle logout:

In your logout method:
```dart
Future<void> logout() async {
  // ... other logout code ...
  await FcmService.instance.deleteFcmToken();
  await LocalStorageService.clearFcmToken();
}
```

---

## ⚠️ Troubleshooting

| Issue | Solution |
|-------|----------|
| **Gradle build fails** | Ensure `isCoreLibraryDesugaringEnabled = true` in `build.gradle.kts` |
| **FCM token is null** | Verify Firebase is initialized; check Firebase project settings |
| **Notification not showing** | Check notification permissions are granted; verify channel ID matches |
| **App crashes on notification** | Add `@pragma('vm:entry-point')` to background handler |
| **Foreground notification not appearing** | Ensure `LocalNotificationService.instance.init()` is called in `FcmService.init()` |

---

## 📚 Reference

- [Firebase Cloud Messaging Docs](https://firebase.google.com/docs/cloud-messaging)
- [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications)
- [firebase_messaging v16+ Migration](https://firebase.flutter.dev/docs/messaging/overview/)

---

## ✨ Summary

Your app now has:
- ✅ FCM integration with automatic token management
- ✅ Foreground local notifications
- ✅ Background message handling
- ✅ Proper permission requests
- ✅ Deep linking on notification tap
- ✅ Token refresh & logout cleanup
- ✅ Comprehensive error logging

Happy notifying! 🎉
