import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hike/Jwt/auth_controller.dart';

class LoginController extends GetxController {
  late TextEditingController phoneNumberController, passwordController;
  final _authService = AuthService();
  final storage = const FlutterSecureStorage();
  var isAuthenticated = false.obs;
  var fullName = "".obs;
  var role = "".obs; // Make role observable

  @override
  void onInit() {
    print("LoginController Initialized");
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    checkAuthStatus(); // ✅ Check session status when controller is initialized
    super.onInit();
    loadUserRole(); // Load role on init
    loadFullName();
  }

  Future<void> loadUserRole() async {
    String? token = await _authService.getToken();
    String? storedRole = await storage.read(key: "role");

    print("Stored Role: $storedRole"); // Debugging Line

    if (token != null) {
      isAuthenticated.value = true;
      role.value = storedRole ?? ""; // Ensure role updates if user is logged in
    } else {
      isAuthenticated.value = false;
      role.value = ""; // Clear role if no token is found
    }
  }

  Future<String?> getFullName() async {
    return await storage.read(key: 'fullname');
  }

  Future<void> loadFullName() async {
    String? name = await getFullName();
    fullName.value = name ?? "Default Name";
  }

  void userLoginVerify() {
    if (phoneNumberController.text.isEmpty) {
      Get.snackbar('Error', 'Phone number cannot be empty',
          messageText: const Text('Please enter your phone number'));
      return;
    }
    if (passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Password cannot be empty',
          messageText: const Text('Please enter your password'));
      return;
    }
    Get.showOverlay(
      asyncFunction: login,
      loadingWidget: const Center(child: CircularProgressIndicator()),
    );
  }

  Future<void> login() async {
    String? token = await _authService.login(
        phoneNumberController.text, passwordController.text);

    if (token != null) {
      // String? role = await storage.read(key: "role");

      String? storedRole = await storage.read(key: "role");

      String? name = await storage.read(key: "fullname");

      print("Logged in as: $storedRole"); // Debugging

      fullName.value = name ?? "";
      role.value = storedRole ?? ""; // ✅ Ensure role updates before navigation

      isAuthenticated.value = true; // ✅ Set authentication flag
      if (storedRole == "Driver") {
        Get.toNamed("/driver_home_page");
      } else {
        Get.toNamed("/rider_home_page");
      }
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    role.value = ""; // Clear role
    resetSession(); // ✅ Reset local session data
  }

  Future<void> checkAuthStatus() async {
    print("Checking authentication status...");

    String? token = await _authService.getToken();
    String? storedRole = await storage.read(key: "role");
    String? name = await storage.read(key: "fullname");

    print("Token: $token, Role: $role, Fullname: $name");

    if (token != null) {
      isAuthenticated.value = true;
      fullName.value = name ?? "Default Name";

      if (storedRole == "Driver") {
        print("Navigating to Driver Home Page...");
        Get.toNamed("/driver_home_page");
      } else {
        print("Navigating to Rider Home Page...");
        Get.toNamed("/rider_home_page");
      }
    } else {
      print("Navigating to Login Page...");
      isAuthenticated.value = false;
      fullName.value = "Default Name";
      Get.toNamed("/rider_login");
    }
  }

  void resetSession() async {
    isAuthenticated.value = false;

    // ✅ Ensure SecureStorage is cleared
    await storage.delete(key: "role");
    await storage.deleteAll(); // Clears all stored values (optional)

    role.value = ""; // ✅ Ensure observable role is reset
    isAuthenticated.value = false; // ✅ Ensure user is marked as logged out
    fullName.value = ""; // ✅ Reset displayed name
    Get.toNamed("/rider_login");
  }
}
