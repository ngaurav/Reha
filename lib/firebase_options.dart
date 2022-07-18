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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAr3l718TU3efWc2_Duxh5wsZfhCuP7a0M',
    appId: '1:435535355142:web:e5366d510cc96529575287',
    messagingSenderId: '435535355142',
    projectId: 'rehab-e680f',
    authDomain: 'rehab-e680f.firebaseapp.com',
    storageBucket: 'rehab-e680f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9ss9qNcyeqHMuCN9k7i3CXD5ds9yoFYE',
    appId: '1:435535355142:android:a5ac7741d1639023575287',
    messagingSenderId: '435535355142',
    projectId: 'rehab-e680f',
    storageBucket: 'rehab-e680f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBLThktxScbKxnSbtyii6Tv05CCl-nskTA',
    appId: '1:435535355142:ios:f1850c7272212dc4575287',
    messagingSenderId: '435535355142',
    projectId: 'rehab-e680f',
    storageBucket: 'rehab-e680f.appspot.com',
    iosClientId:
        '435535355142-1u6p39kffd7q6u5lfhupaag47r59da3o.apps.googleusercontent.com',
    iosBundleId: 'com.example.rehab',
  );
}