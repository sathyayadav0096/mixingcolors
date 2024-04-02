// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static  const FirebaseOptions web =  FirebaseOptions(
    apiKey: 'AIzaSyCvPWAPn1giaOl5u3lm9o6NhGro1wHgwIQ',
    appId: '1:1022221267332:web:084fd93e70c38a21892dd1',
    messagingSenderId: '1022221267332',
    projectId: 'mixingcolors',
    authDomain: 'mixingcolors.firebaseapp.com',
    storageBucket: 'mixingcolors.appspot.com',
    measurementId: 'G-1PRQX6M5R2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWJkXe26ftVbscqGsAHmIsR3R156DUc1A',
    appId: '1:1022221267332:android:68971d703900c803892dd1',
    messagingSenderId: '1022221267332',
    projectId: 'mixingcolors',
    storageBucket: 'mixingcolors.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiWE-_qPYdAr9eXAKVF21Lt_DVY3HJdPA',
    appId: '1:1022221267332:ios:16efeb8c83ad2b19892dd1',
    messagingSenderId: '1022221267332',
    projectId: 'mixingcolors',
    storageBucket: 'mixingcolors.appspot.com',
    iosBundleId: 'com.example.mixingcolors',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCiWE-_qPYdAr9eXAKVF21Lt_DVY3HJdPA',
    appId: '1:1022221267332:ios:dc1b621382aeabaf892dd1',
    messagingSenderId: '1022221267332',
    projectId: 'mixingcolors',
    storageBucket: 'mixingcolors.appspot.com',
    iosBundleId: 'com.example.mixingcolors.RunnerTests',
  );
}
