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
    apiKey: 'AIzaSyAZH-f_xnIzexDkPmeyJYjSoj7-m2qEces',
    appId: '1:283142088756:web:e0d63dbbaa42179b8f4261',
    messagingSenderId: '283142088756',
    projectId: 'flutterredsocial',
    authDomain: 'flutterredsocial.firebaseapp.com',
    storageBucket: 'flutterredsocial.appspot.com',
    measurementId: 'G-ZCKJVPK96K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDgJvDIe6J-jpLka5aCLun7Vk74Tdo88mw',
    appId: '1:283142088756:android:d0482a8b4d71d50b8f4261',
    messagingSenderId: '283142088756',
    projectId: 'flutterredsocial',
    storageBucket: 'flutterredsocial.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBGwHt3KN4J-fncWR60ruOHGnHAxJex3iw',
    appId: '1:283142088756:ios:6238252b64f9d3648f4261',
    messagingSenderId: '283142088756',
    projectId: 'flutterredsocial',
    storageBucket: 'flutterredsocial.appspot.com',
    iosBundleId: 'com.example.flutterRedSocial',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBGwHt3KN4J-fncWR60ruOHGnHAxJex3iw',
    appId: '1:283142088756:ios:6238252b64f9d3648f4261',
    messagingSenderId: '283142088756',
    projectId: 'flutterredsocial',
    storageBucket: 'flutterredsocial.appspot.com',
    iosBundleId: 'com.example.flutterRedSocial',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAZH-f_xnIzexDkPmeyJYjSoj7-m2qEces',
    appId: '1:283142088756:web:7c54732a8ccfad508f4261',
    messagingSenderId: '283142088756',
    projectId: 'flutterredsocial',
    authDomain: 'flutterredsocial.firebaseapp.com',
    storageBucket: 'flutterredsocial.appspot.com',
    measurementId: 'G-64894QX2GY',
  );
}