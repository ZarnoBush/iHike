import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hike/Utils/custom_snacbar.dart';
import 'package:hike/Utils/loader.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  late TextEditingController fullnameController,
      phoneNumberController,
      passwordController;
  var selectedRole = "Rider";
  var selectedGender = "Male";
  var isLoading = false.obs;

  @override
  void onInit() {
    fullnameController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    fullnameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  userVerify() {
    if (fullnameController.text.isEmpty) {
      customSnackbar(
          'Error', 'Fullname cannot be empty', 'Please enter your fullname');
      return false;
    }
    if (phoneNumberController.text.isEmpty) {
      customSnackbar('Error', 'Phone number cannot be empty',
          'Please enter your phone number');
      return false;
    }
    if (passwordController.text.isEmpty) {
      customSnackbar(
          'Error', 'Password cannot be empty', 'Please enter your password');
      return false;
    }
    Get.showOverlay(asyncFunction: registerUser, loadingWidget: Loader());
  }

  Future<void> registerUser() async {
    isLoading.value = true;
    var url = Uri.parse('https://localhost/flutter/ihike/signin.php');

    var response = await http.post(url, body: {
      'fullname': fullnameController.text,
      'contact': phoneNumberController.text,
      'password': passwordController.text,
      'role': selectedRole,
      'gender': selectedGender,
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['success']) {
        customSnackbar(
            'Success', data['message'], 'User registered successfully');
        Get.offAndToNamed('/rider_login');
      } else {
        customSnackbar('Error', data['message'], 'Registration Failed');
      }
    } else {
      customSnackbar('Error', response.statusCode, 'Registration Failed');
    }
    isLoading.value = false;
  }
}
