import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hike/Controllers/login_controller.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "https://localhost/flutter/ihike";
  final String externalUrl = "http://192.168.1.97/flutter/ihike";
  final storage = const FlutterSecureStorage();

  Future<String?> login(String contact, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login.php"),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {"contact": contact, "password": password},
    );

    final data = jsonDecode(response.body);
    print('User ID: ${data["id"]}');

    if (response.statusCode == 200 && data.containsKey("token")) {
      await storage.write(key: "jwt_token", value: data["token"]);
      await storage.write(key: "user_id", value: data["id"].toString());
      await storage.write(key: "fullname", value: data["fullname"]);
      await storage.write(key: "role", value: data["role"]);

      // // ✅ Immediately update fullName in LoginController
      // final loginController = Get.find<LoginController>();
      // loginController.fullName.value = data["fullname"] ?? "Unknown User";

      return data["token"];
    }
    return null;
  }

  Future<void> initializeFCM(String userId) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission();

    String? token = await messaging.getToken();
    if (token != null) {
      print("FCM Token: $token");

      await http.post(
        Uri.parse("http://localhost/flutter/ihike/save_fcm_token.php"),
        body: {
          "user_id": userId,
          "fcm_token": token,
        },
      );
    }

    // Foreground listener
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Foreground Message: ${message.notification?.title}');
      // You can show custom alert here
    });
  }

  // in your controller (e.g. AuthController or HomeController)
  // Future<void> initializeFCM(String userId) async {
  //   FirebaseMessaging messaging = FirebaseMessaging.instance;

  //   // Request permissions
  //   await messaging.requestPermission();

  //   // Get token
  //   String? token = await messaging.getToken();
  //   if (token != null) {
  //     print("FCM Token: $token");

  //     // Send to backend
  //     await http.post(
  //       Uri.parse("http://192.168.1.97/flutter/ihike/save_fcm_token.php"),
  //       headers: {"Content-Type": "application/x-www-form-urlencoded"},
  //       body: {
  //         "user_id": userId,
  //         "fcm_token": token,
  //       },
  //     );
  //   }
  // }

  Future<void> logout() async {
    await storage.deleteAll(); // ✅ Clear ALL session data
    Get.find<LoginController>().resetSession(); // ✅ Reset UI session state
    Get.toNamed("/rider_login");
  }

  Future<String?> getToken() async {
    return await storage.read(key: "jwt_token");
  }
}
