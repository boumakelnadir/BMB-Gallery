// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCd1OzL7Y2WMkLDeWxHV6GlAhFvZZ8rtJk',
    appId: '1:481185432802:web:8dd3b6b09db386397c4abb',
    messagingSenderId: '481185432802',
    projectId: 'notes2-4c764',
    authDomain: 'notes2-4c764.firebaseapp.com',
    storageBucket: 'notes2-4c764.appspot.com',
    measurementId: 'G-T9NNQE0YMY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCkFhItz0jC7UZJEoZLh6Cl-9e2rekCwA',
    appId: '1:481185432802:android:b77c25bf36458fce7c4abb',
    messagingSenderId: '481185432802',
    projectId: 'notes2-4c764',
    storageBucket: 'notes2-4c764.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAmOx0A9WCMqp1LGyNXQPiE6dq23i0MKpc',
    appId: '1:481185432802:ios:e0c63bc6ccb8961a7c4abb',
    messagingSenderId: '481185432802',
    projectId: 'notes2-4c764',
    storageBucket: 'notes2-4c764.appspot.com',
    iosBundleId: 'com.example.notes2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAmOx0A9WCMqp1LGyNXQPiE6dq23i0MKpc',
    appId: '1:481185432802:ios:e0c63bc6ccb8961a7c4abb',
    messagingSenderId: '481185432802',
    projectId: 'notes2-4c764',
    storageBucket: 'notes2-4c764.appspot.com',
    iosBundleId: 'com.example.notes2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCd1OzL7Y2WMkLDeWxHV6GlAhFvZZ8rtJk',
    appId: '1:481185432802:web:3776d71bcae5919a7c4abb',
    messagingSenderId: '481185432802',
    projectId: 'notes2-4c764',
    authDomain: 'notes2-4c764.firebaseapp.com',
    storageBucket: 'notes2-4c764.appspot.com',
    measurementId: 'G-GN13G5TR8K',
  );

}