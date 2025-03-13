import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hike/Utils/custom_snacbar.dart';
import 'package:hike/Utils/loader.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  late TextEditingController? contactController, passwordController;

  @override
  void onInit() {
    super.onInit();
    contactController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    contactController!.dispose();
    passwordController!.dispose();
  }

  checklogin() {
    if (contactController!.text.isEmpty) {
      customSnackbar('Error', 'contact is required', 'error');
    } else if (passwordController!.text.isEmpty) {
      customSnackbar('Error', 'Password is required', 'error');
    } else {
      Get.showOverlay(asyncFunction: login, loadingWidget: Loader());
    }
  }

  Future<void> login() async {
    String url = 'https://localhost/flutter/ihike/login.php';

    Map<String, dynamic> dataParams = {
      'contact': contactController!.text,
      'password': passwordController!.text
    };

    try {
      var response = await http.post(Uri.parse(url), body: dataParams);
      if (response.statusCode == 200) {
        var res = await jsonDecode(response.body);
        if (res['success']) {
          int? userId = res['user_id'];
          print('User ID: $userId');
          print('User: ${res['user']}');
          customSnackbar('Success', res['message'], 'success');
          Get.offAllNamed('/user_nav');
        } else {
          customSnackbar('Error', res['message'], 'error');
        }
      } else {
        customSnackbar('Error', '${response.statusCode}', 'error');
      }
    } catch (e) {
      print('Try Error: $e');
    }
  }
}
