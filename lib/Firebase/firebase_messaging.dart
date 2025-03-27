
import 'package:firebase_messaging/firebase_messaging.dart';

void setupFirebaseMessaging() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Request notification permission for iOS (important for iOS apps)
  NotificationSettings settings = await messaging.requestPermission();
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else {
    print('User declined or has not accepted permission');
  }

  // Get the FCM token
  String? token = await messaging.getToken();
  print("FCM Token: $token");

  // You can also set up background and foreground message handlers
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Message received: ${message.notification?.title}");
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("Message opened from background: ${message.notification?.title}");
  });
}