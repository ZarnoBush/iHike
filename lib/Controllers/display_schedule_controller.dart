import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hike/Utils/custom_snacbar.dart';
import 'package:http/http.dart' as http;

class DisplayScheduleController extends GetxController {

  @override
  void onInit() {
    displaySchedule(); // Just call the method here, no need for update()
    super.onInit();
  }

  Future<List<dynamic>> displaySchedule() async {
    String url = 'https://localhost/flutter/ihike/display_schedules.php';

    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        if (res['success']) {
          return res['data'];
        } else {
          throw Exception('Error fetching schedule: ${res['message']}');
        }
      } else {
        throw Exception('StatusCode: Error fetching schedule: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Try: Error fetching schedule: $e');
    }
  }
}
