import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreviewController extends GetxController {
  Future<Map<String, dynamic>> fetchPostWithUser(int postId) async {
    String url = 'https://localhost/flutter/ihike/preview.php?post_id=$postId';

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        
        if (data['success']) {
          return data['data']; // Return full post details with user info
        } else {
          throw Exception(data['message']);
        }
      } else {
        throw Exception('Failed to load post details');
      }
    } catch (e) {
      throw Exception('Something went wrong: $e');
    }
  }
}
