import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

Future<void> saveFcmToken(String userId) async {
  String? fcmToken = await FirebaseMessaging.instance.getToken();

  if (fcmToken != null) {
    await http.post(
      Uri.parse("http://192.168.1.97/flutter/ihike/save_token.php"),
      body: {
        'user_id': userId,
        'fcm_token': fcmToken,
      },
    );
  }
}
