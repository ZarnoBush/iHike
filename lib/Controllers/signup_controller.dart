import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hike/Utils/custom_snacbar.dart';
import 'package:hike/Utils/loader.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
  late TextEditingController? fullnameController,
      genderController,
      contactController,
      passwordController;

  @override
  void onInit() {
    super.onInit();
    fullnameController = TextEditingController();
    genderController = TextEditingController();
    contactController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    fullnameController!.dispose();
    genderController!.dispose();
    contactController!.dispose();
    passwordController!.dispose();
  }

  checkSignup() {
    if (fullnameController!.text.isEmpty) {
      customSnackbar('Error', 'Fullname is required!', 'error');
    } else if (genderController!.text.isEmpty) {
      customSnackbar('Error', 'Gender is required!', 'error');
    } else if (contactController!.text.isEmpty) {
      customSnackbar('Error', 'Contact is required!', 'error');
    } else if (passwordController!.text.isEmpty) {
      customSnackbar('Error', 'Password is required!', 'error');
    } else {
      Get.showOverlay(asyncFunction: () => signup(), loadingWidget: Loader());
    }
  }

  signup() async {
    String url = 'https://localhost/flutter/ihike/signin.php';

    Map<String, dynamic> dataParams = {
      'fullname': fullnameController!.text,
      'gender': genderController!.text,
      'contact': contactController!.text,
      'password': passwordController!.text,
    };

    try {
      var response = await http.post(Uri.parse(url), body: dataParams);
      if (response.statusCode == 200) {
        var res = await jsonDecode(response.body);
        if (res['success'] == true) {
          int userId = res['user_id']; // Get user_id from API response
          print('User ID: $userId');
          // Store user_id in GetStorage
          final storage = GetStorage();
          storage.write('user_id', userId.toString());
          customSnackbar('Success', res['message'], 'success');
          Get.offAllNamed('/user_login');
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
