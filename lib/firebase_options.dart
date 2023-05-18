// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
// / import 'firebase_options.dart';
// / // ...
// / await Firebase.initializeApp(
// /   options: DefaultFirebaseOptions.currentPlatform,
// / );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCBxrJqgcK5wRvPfSRzToZN73M8vXmy39M',
    appId: '1:868873101597:android:02a9b584b39bb1267881f4',
    messagingSenderId: '868873101597',
    projectId: 'chromatica-dce43',
    storageBucket: 'chromatica-dce43.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB44beXfEFuDPFFGL6EFsDWfh8hg16S0bA',
    appId: '1:868873101597:ios:44d8fc781757363e7881f4',
    messagingSenderId: '868873101597',
    projectId: 'chromatica-dce43',
    storageBucket: 'chromatica-dce43.appspot.com',
    iosClientId: '868873101597-7edtkfaps8v87ipnj1osfeqlvsd6rql8.apps.googleusercontent.com',
    iosBundleId: 'com.example.chromatica',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB44beXfEFuDPFFGL6EFsDWfh8hg16S0bA',
    appId: '1:868873101597:ios:44d8fc781757363e7881f4',
    messagingSenderId: '868873101597',
    projectId: 'chromatica-dce43',
    storageBucket: 'chromatica-dce43.appspot.com',
    iosClientId: '868873101597-7edtkfaps8v87ipnj1osfeqlvsd6rql8.apps.googleusercontent.com',
    iosBundleId: 'com.example.chromatica',
  );
}
