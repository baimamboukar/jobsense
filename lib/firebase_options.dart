// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

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
    apiKey: 'AIzaSyBvK4G_nHsf_Q0hIZNvA6psBn8wDu4kldg',
    appId: '1:438012950802:web:8121c15bd6e76f43351bcb',
    messagingSenderId: '438012950802',
    projectId: 'jobsense-brain',
    authDomain: 'jobsense-brain.firebaseapp.com',
    storageBucket: 'jobsense-brain.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrGk5jgFfbySx1dBsqkC1Dk8IyXJRsfME',
    appId: '1:438012950802:android:c979e3ec8294f5ed351bcb',
    messagingSenderId: '438012950802',
    projectId: 'jobsense-brain',
    storageBucket: 'jobsense-brain.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQJHIl-4cO_N8KUwljJuI1R__L2PpFKc4',
    appId: '1:438012950802:ios:9df0fa19b1631288351bcb',
    messagingSenderId: '438012950802',
    projectId: 'jobsense-brain',
    storageBucket: 'jobsense-brain.appspot.com',
    iosBundleId: 'dev.baimamboukar.jobsense',
  );
}
