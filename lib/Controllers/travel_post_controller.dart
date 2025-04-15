import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hike/Controllers/date_time_controller.dart';
import 'package:hike/Utils/custom_snacbar.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class TravelPostController extends GetxController {
  late TextEditingController? pickupController;
  late TextEditingController? dropoffController;
  late TextEditingController? passengersController;
  final String baseUrl = "https://localhost/flutter/ihike";
  final String externalUrl = "http://192.168.1.5/ihike";
  final storage = const FlutterSecureStorage();

  final dateTimeController = Get.put(DateTimeController());

  var travelId = 0.obs;

  @override
  onInit() {
    pickupController = TextEditingController();
    dropoffController = TextEditingController();
    passengersController = TextEditingController();
    super.onInit();
  }

  Future<void> createTravelPost() async {
    String? user_id = await storage.read(key: "user_id");
    String? role = await storage.read(key: "role");
    String? token = await storage.read(key: "jwt_token");

    if (token == null) {
      print("No token found! User needs to log in.");
      return;
    }

    final response =
        await http.post(Uri.parse("$externalUrl/post_travels.php"), headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    }, body: {
      "user_id": user_id,
      "role": role,
      "travel_pick_up": pickupController!.text,
      "travel_drop_off": dropoffController!.text,
      "travel_passengers": passengersController!.text,
      "travel_time": dateTimeController
          .formatTimeOfDay(dateTimeController.selectedTime.value),
      "travel_date": dateTimeController.selectedDate.value.toString(),
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data["success"] == true) {
        await storage.write(
            key: "travel_id", value: data["travel_id"].toString());
        customSnackbar('Success', '${data['message']}', 'success');
      } else {
        customSnackbar('Error', '${data['message']}', 'error');
      }
    } else {
      customSnackbar('Error', '${response.statusCode}', 'error');
    }
  }
}
