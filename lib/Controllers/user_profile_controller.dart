import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hike/models/user_model.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  var userProfile = UserModel(id: '' ,fullname: '', contact: '', gender: '', password: '').obs;

  @override
  void onInit() {
    fetchUserProfile();
    super.onInit();
  }

  void fetchUserProfile() async {
    String url = 'https://localhost/flutter/ihike/get_user_profile.php'; // Your endpoint

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = await jsonDecode(response.body);
        if (data['success']) {
          userProfile.value = UserModel(
            id: data['id'],
            fullname: data['fullname'],
            gender: data['gender'],
            contact: data['contact'],
            password: data['password'], // Ensure to handle sensitive data securely
          );
        } else {
          // Handle error
        }
      } else {
        // Handle non-200 response
      }
    } catch (e) {
      print('Fetch Error: $e');
    }
  }
}
