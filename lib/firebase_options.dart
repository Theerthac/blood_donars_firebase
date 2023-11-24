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
    apiKey: 'AIzaSyD25g1_Cn2TUThwxghaKYexZOODfaZA5kU',
    appId: '1:993875354873:web:4496479ba643b22a5a6e28',
    messagingSenderId: '993875354873',
    projectId: 'blood-donation-55d6d',
    authDomain: 'blood-donation-55d6d.firebaseapp.com',
    storageBucket: 'blood-donation-55d6d.appspot.com',
    measurementId: 'G-4GNE06GWLW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDaoeyOdR2sZFqTZlwuI6oyWP8LMa600SA',
    appId: '1:993875354873:android:d5ab30bab37fdd705a6e28',
    messagingSenderId: '993875354873',
    projectId: 'blood-donation-55d6d',
    storageBucket: 'blood-donation-55d6d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBq3eMk1150TM46ESZS-NIMShbsN-Ob6mE',
    appId: '1:993875354873:ios:b3547e7c6ac283c35a6e28',
    messagingSenderId: '993875354873',
    projectId: 'blood-donation-55d6d',
    storageBucket: 'blood-donation-55d6d.appspot.com',
    iosBundleId: 'com.example.bloodDonation',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBq3eMk1150TM46ESZS-NIMShbsN-Ob6mE',
    appId: '1:993875354873:ios:f5b5ee5797d251005a6e28',
    messagingSenderId: '993875354873',
    projectId: 'blood-donation-55d6d',
    storageBucket: 'blood-donation-55d6d.appspot.com',
    iosBundleId: 'com.example.bloodDonation.RunnerTests',
  );
}
