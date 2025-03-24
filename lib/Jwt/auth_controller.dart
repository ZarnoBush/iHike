import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hike/Controllers/login_controller.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "https://localhost/flutter/ihike";
  final storage = const FlutterSecureStorage();

  Future<String?> login(String contact, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login.php"),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {"contact": contact, "password": password},
    );

    final data = jsonDecode(response.body);
    print('user id: ${data["id"]}');
    if (response.statusCode == 200 && data.containsKey("token")) {
      await storage.write(key: "jwt_token", value: data["token"]);
      await storage.write(key: "user_id", value: data["id"].toString());
      await storage.write(key: "fullname", value: data["fullname"]);
      await storage.write(key: "role", value: data["role"]);
      return data["token"];
    }
    return null;
  }

  Future<void> logout() async {
    await storage.delete(key: "jwt_token");
    Get.find<LoginController>().fullName.value = "Reset Name"; // Reset fullName
  }

  Future<String?> getToken() async {
    return await storage.read(key: "jwt_token");
  }
}
