import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:hike/Jwt/auth_controller.dart';
import 'package:hike/Utils/custom_snacbar.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late TextEditingController? phoneNumberController, passwordController;
  final _authService = AuthService();
  final storage = const FlutterSecureStorage();
  var isAuthenticated = false.obs;
  var fullName = "".obs;

  @override
  void onInit() {
    print("AuthController Initialized");
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    checkAuthStatus();
    loadFullName();
    super.onInit();
  }

  // @override
  // void onClose() {
  //   phoneNumberController!.dispose();
  //   passwordController!.dispose();
  //   super.onClose();
  // }

  Future<String?> fullname() async {
    return await storage.read(key: 'fullname');
  }

  Future<void> loadFullName() async {
    String? name = await fullname();
    fullName.value = name ?? "Default Name";
  }

  userLoginVerify() {
    if (phoneNumberController!.text.isEmpty) {
      Get.snackbar('Error', 'Phone number cannot be empty',
          messageText: Text('Please enter your phone number'));
      return false;
    }
    if (passwordController!.text.isEmpty) {
      Get.snackbar('Error', 'Password cannot be empty',
          messageText: Text('Please enter your password'));
      return false;
    }
    Get.showOverlay(
        asyncFunction: login,
        loadingWidget: Center(
          child: CircularProgressIndicator(),
        ));
  }

  Future<void> login() async {
    String? token = await _authService.login(
        phoneNumberController!.text, passwordController!.text);
    String? role = await storage.read(key: "role");
    if (token != null) {
      if (role == "Driver") {
        Get.toNamed("/driver_home_page");
      } else {
        Get.toNamed("/rider_home_page");
      }
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    isAuthenticated.value = false;
    Get.toNamed("/rider_login");
  }

  Future<void> checkAuthStatus() async {
    print("Checking authentication status...");

    String? token = await _authService.getToken();
    String? role = await storage.read(key: "role");
    String? fullname = await storage.read(key: "fullname");
    print("token: $token, role: $role, fullname: $fullname");
    // fullName.value = fullname ?? "Default Name";

    if (token != null) {
      isAuthenticated.value = true;
      if (role == "Driver") {
        print("Navigating to Driver Home Page...");
        Get.toNamed("/driver_home_page");
      } else {
        print("Navigating to Rider Home Page...");
        Get.toNamed("/rider_home_page");
      }
    } else {
      print("Navigating to Login Page...");
      Get.toNamed("/rider_login");
      isAuthenticated.value = false;
    }
  }
}
