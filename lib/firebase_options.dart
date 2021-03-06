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
    apiKey: 'AIzaSyB1UYnFklruZlW-yX5qdzBtmcDw-dk-nsk',
    appId: '1:876070741712:web:e78619bc3269627e9ca0d5',
    messagingSenderId: '876070741712',
    projectId: 'cape-bbf72',
    authDomain: 'cape-bbf72.firebaseapp.com',
    storageBucket: 'cape-bbf72.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0xTaX5S6qmlT-n8jvsF0r53BdixFKD0E',
    appId: '1:876070741712:android:8589d9b66736b16e9ca0d5',
    messagingSenderId: '876070741712',
    projectId: 'cape-bbf72',
    storageBucket: 'cape-bbf72.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBtzkwgtRWhJgdYKtY4CZBvxN_LZf4WZDg',
    appId: '1:876070741712:ios:983097a15bfff1b89ca0d5',
    messagingSenderId: '876070741712',
    projectId: 'cape-bbf72',
    storageBucket: 'cape-bbf72.appspot.com',
    iosClientId: '876070741712-4fn9qvdaltsldnjkf289a8a92tifm865.apps.googleusercontent.com',
    iosBundleId: 'com.example.capeFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBtzkwgtRWhJgdYKtY4CZBvxN_LZf4WZDg',
    appId: '1:876070741712:ios:983097a15bfff1b89ca0d5',
    messagingSenderId: '876070741712',
    projectId: 'cape-bbf72',
    storageBucket: 'cape-bbf72.appspot.com',
    iosClientId: '876070741712-4fn9qvdaltsldnjkf289a8a92tifm865.apps.googleusercontent.com',
    iosBundleId: 'com.example.capeFlutter',
  );
}
