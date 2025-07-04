/// lib/firebase/firebase_env.dart
/// Secure FirebaseOptions for all Flutter-supported platforms,
/// reading credentials from environment variables (.env).

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';

class EnvFirebaseOptions {
  /// Returns the correct FirebaseOptions depending on the current platform.
  static FirebaseOptions get current {
    if (kIsWeb) return web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        return linux;
      default:
        throw UnsupportedError('FirebaseOptions not supported for this platform');
    }
  }

  /// Web configuration (adds authDomain & measurementId)
  static FirebaseOptions get web => FirebaseOptions(
        apiKey: dotenv.env['WEB_API_KEY']!,
        appId: dotenv.env['WEB_APP_ID']!,
        messagingSenderId: dotenv.env['WEB_MESSAGING_SENDER_ID']!,
        projectId: dotenv.env['WEB_PROJECT_ID']!,
        authDomain: dotenv.env['WEB_AUTH_DOMAIN']!,
        storageBucket: dotenv.env['WEB_STORAGE_BUCKET']!,
        measurementId: dotenv.env['WEB_MEASUREMENT_ID']!,
      );

  /// Android configuration
  static FirebaseOptions get android => FirebaseOptions(
        apiKey: dotenv.env['ANDROID_API_KEY']!,
        appId: dotenv.env['ANDROID_APP_ID']!,
        messagingSenderId: dotenv.env['ANDROID_MESSAGING_SENDER_ID']!,
        projectId: dotenv.env['ANDROID_PROJECT_ID']!,
        storageBucket: dotenv.env['ANDROID_STORAGE_BUCKET']!,
      );

  /// iOS configuration
  static FirebaseOptions get ios => FirebaseOptions(
        apiKey: dotenv.env['IOS_API_KEY']!,
        appId: dotenv.env['IOS_APP_ID']!,
        messagingSenderId: dotenv.env['IOS_MESSAGING_SENDER_ID']!,
        projectId: dotenv.env['IOS_PROJECT_ID']!,
        storageBucket: dotenv.env['IOS_STORAGE_BUCKET']!,
        iosBundleId: dotenv.env['IOS_BUNDLE_ID']!,
      );

  /// macOS configuration (same fields as iOS)
  static FirebaseOptions get macos => FirebaseOptions(
        apiKey: dotenv.env['MACOS_API_KEY']!,
        appId: dotenv.env['MACOS_APP_ID']!,
        messagingSenderId: dotenv.env['MACOS_MESSAGING_SENDER_ID']!,
        projectId: dotenv.env['MACOS_PROJECT_ID']!,
        storageBucket: dotenv.env['MACOS_STORAGE_BUCKET']!,
        iosBundleId: dotenv.env['MACOS_BUNDLE_ID']!,
      );

  /// Windows configuration (adds authDomain & measurementId)
  static FirebaseOptions get windows => FirebaseOptions(
        apiKey: dotenv.env['WINDOWS_API_KEY']!,
        appId: dotenv.env['WINDOWS_APP_ID']!,
        messagingSenderId: dotenv.env['WINDOWS_MESSAGING_SENDER_ID']!,
        projectId: dotenv.env['WINDOWS_PROJECT_ID']!,
        authDomain: dotenv.env['WINDOWS_AUTH_DOMAIN']!,
        storageBucket: dotenv.env['WINDOWS_STORAGE_BUCKET']!,
        measurementId: dotenv.env['WINDOWS_MEASUREMENT_ID']!,
      );

  /// Linux configuration (treat similarly to windows)
  static FirebaseOptions get linux => FirebaseOptions(
        apiKey: dotenv.env['LINUX_API_KEY']!,
        appId: dotenv.env['LINUX_APP_ID']!,
        messagingSenderId: dotenv.env['LINUX_MESSAGING_SENDER_ID']!,
        projectId: dotenv.env['LINUX_PROJECT_ID']!,
        authDomain: dotenv.env['LINUX_AUTH_DOMAIN']!,
        storageBucket: dotenv.env['LINUX_STORAGE_BUCKET']!,
        measurementId: dotenv.env['LINUX_MEASUREMENT_ID']!,
      );
}
