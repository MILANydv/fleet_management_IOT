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
    apiKey: 'AIzaSyDaJIJ2S0mOiZpFn_5rfd_OKATAX8dNK8U',
    appId: '1:742175489363:web:8636312097ba5f2657f5a6',
    messagingSenderId: '742175489363',
    projectId: 'fleet-management-bdecd',
    authDomain: 'fleet-management-bdecd.firebaseapp.com',
    storageBucket: 'fleet-management-bdecd.appspot.com',
    measurementId: 'G-5MRB85E983',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDnjcxZUuhYpJxOyO0a_sKQw-nfUOchU_U',
    appId: '1:742175489363:android:734efa1542286f4757f5a6',
    messagingSenderId: '742175489363',
    projectId: 'fleet-management-bdecd',
    storageBucket: 'fleet-management-bdecd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeJbZyC7NmD6d_5l_1s8umeS2X2ESRCqE',
    appId: '1:742175489363:ios:85c4c2da3acf862f57f5a6',
    messagingSenderId: '742175489363',
    projectId: 'fleet-management-bdecd',
    storageBucket: 'fleet-management-bdecd.appspot.com',
    iosClientId: '742175489363-vqtpclbq0up48ehvks0aitj9oo76hsuv.apps.googleusercontent.com',
    iosBundleId: 'com.example.fleetManagement',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCeJbZyC7NmD6d_5l_1s8umeS2X2ESRCqE',
    appId: '1:742175489363:ios:85c4c2da3acf862f57f5a6',
    messagingSenderId: '742175489363',
    projectId: 'fleet-management-bdecd',
    storageBucket: 'fleet-management-bdecd.appspot.com',
    iosClientId: '742175489363-vqtpclbq0up48ehvks0aitj9oo76hsuv.apps.googleusercontent.com',
    iosBundleId: 'com.example.fleetManagement',
  );
}
