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
    apiKey: 'AIzaSyAtCAveZkeftvfX8iHHe29UWpc5JTZ9Vnc',
    appId: '1:1045840464449:web:e2b882b180444826d1d4c0',
    messagingSenderId: '1045840464449',
    projectId: 'rick-and-morty-a3358',
    authDomain: 'rick-and-morty-a3358.firebaseapp.com',
    storageBucket: 'rick-and-morty-a3358.appspot.com',
    measurementId: 'G-PX2N1K211F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCh5bEJMANFU3c33dXcmEzPordY0KXKImQ',
    appId: '1:1045840464449:android:8118e4293b9e9d44d1d4c0',
    messagingSenderId: '1045840464449',
    projectId: 'rick-and-morty-a3358',
    storageBucket: 'rick-and-morty-a3358.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyArah32YnCJrjo1jggl-mp4_fTWp0z4sPo',
    appId: '1:1045840464449:ios:5c66f6212ecf5cdad1d4c0',
    messagingSenderId: '1045840464449',
    projectId: 'rick-and-morty-a3358',
    storageBucket: 'rick-and-morty-a3358.appspot.com',
    androidClientId: '1045840464449-anvdeejbr3c02iujnqfuq9ncj439fpu6.apps.googleusercontent.com',
    iosClientId: '1045840464449-6banbp1eo48b8p20scnjpqtn85mv927j.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyArah32YnCJrjo1jggl-mp4_fTWp0z4sPo',
    appId: '1:1045840464449:ios:5c66f6212ecf5cdad1d4c0',
    messagingSenderId: '1045840464449',
    projectId: 'rick-and-morty-a3358',
    storageBucket: 'rick-and-morty-a3358.appspot.com',
    androidClientId: '1045840464449-anvdeejbr3c02iujnqfuq9ncj439fpu6.apps.googleusercontent.com',
    iosClientId: '1045840464449-6banbp1eo48b8p20scnjpqtn85mv927j.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication2',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAtCAveZkeftvfX8iHHe29UWpc5JTZ9Vnc',
    appId: '1:1045840464449:web:c82498a00c7820c6d1d4c0',
    messagingSenderId: '1045840464449',
    projectId: 'rick-and-morty-a3358',
    authDomain: 'rick-and-morty-a3358.firebaseapp.com',
    storageBucket: 'rick-and-morty-a3358.appspot.com',
    measurementId: 'G-G9WX4RKCNY',
  );
}
