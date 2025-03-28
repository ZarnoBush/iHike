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
    apiKey: 'AIzaSyDG4q1eUsEjvggM600S2Y8ifvP6wPoUQT4',
    appId: '1:63500367623:web:3a987924466bda1cce37a2',
    messagingSenderId: '63500367623',
    projectId: 'ihike-f7f16',
    authDomain: 'ihike-f7f16.firebaseapp.com',
    storageBucket: 'ihike-f7f16.firebasestorage.app',
    measurementId: 'G-21KBV955WQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBwAM7XABszCDz9tIp5mHtFTo2ipDFIGvk',
    appId: '1:63500367623:android:9c416dac204c78d5ce37a2',
    messagingSenderId: '63500367623',
    projectId: 'ihike-f7f16',
    storageBucket: 'ihike-f7f16.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB05F9CCDksjDo-aXizK4_YG18Qz3qERJQ',
    appId: '1:63500367623:ios:a0cbb2fe3265225cce37a2',
    messagingSenderId: '63500367623',
    projectId: 'ihike-f7f16',
    storageBucket: 'ihike-f7f16.firebasestorage.app',
    iosBundleId: 'com.example.hike',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB05F9CCDksjDo-aXizK4_YG18Qz3qERJQ',
    appId: '1:63500367623:ios:a0cbb2fe3265225cce37a2',
    messagingSenderId: '63500367623',
    projectId: 'ihike-f7f16',
    storageBucket: 'ihike-f7f16.firebasestorage.app',
    iosBundleId: 'com.example.hike',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDG4q1eUsEjvggM600S2Y8ifvP6wPoUQT4',
    appId: '1:63500367623:web:f571d58cfe7cfa45ce37a2',
    messagingSenderId: '63500367623',
    projectId: 'ihike-f7f16',
    authDomain: 'ihike-f7f16.firebaseapp.com',
    storageBucket: 'ihike-f7f16.firebasestorage.app',
    measurementId: 'G-CVZ23ZKBMT',
  );
}
