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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyANH886iqePJWmNbq_a0S4A3dB1Gsn3tBM',
    appId: '1:463037248086:web:a44dd39c65edab457d41f7',
    messagingSenderId: '463037248086',
    projectId: 'simplequizapp-6442d',
    authDomain: 'simplequizapp-6442d.firebaseapp.com',
    databaseURL: 'https://simplequizapp-6442d-default-rtdb.firebaseio.com',
    storageBucket: 'simplequizapp-6442d.appspot.com',
    measurementId: 'G-1M3TSC2RTZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCwU28ZOzNIU4S0C1VmDzUftMi_I4EBFO0',
    appId: '1:463037248086:android:4b73900bad951fe67d41f7',
    messagingSenderId: '463037248086',
    projectId: 'simplequizapp-6442d',
    databaseURL: 'https://simplequizapp-6442d-default-rtdb.firebaseio.com',
    storageBucket: 'simplequizapp-6442d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRB48Mvve0U3Kj6Z1Rmb9uHIb98AwLFPA',
    appId: '1:463037248086:ios:b227edee5437705e7d41f7',
    messagingSenderId: '463037248086',
    projectId: 'simplequizapp-6442d',
    databaseURL: 'https://simplequizapp-6442d-default-rtdb.firebaseio.com',
    storageBucket: 'simplequizapp-6442d.appspot.com',
    iosBundleId: 'com.example.quizApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBRB48Mvve0U3Kj6Z1Rmb9uHIb98AwLFPA',
    appId: '1:463037248086:ios:273a0f00daf6a8aa7d41f7',
    messagingSenderId: '463037248086',
    projectId: 'simplequizapp-6442d',
    databaseURL: 'https://simplequizapp-6442d-default-rtdb.firebaseio.com',
    storageBucket: 'simplequizapp-6442d.appspot.com',
    iosBundleId: 'com.example.quizApp.RunnerTests',
  );
}