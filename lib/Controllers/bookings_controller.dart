import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hike/Controllers/travel_post_controller.dart';
import 'package:hike/Utils/custom_snacbar.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class BookingsController extends GetxController {
  late TextEditingController pickupController,
      dropoffController,
      passengersController;
  final String baseUrl = "https://localhost/flutter/ihike";
  final storage = FlutterSecureStorage();
  var groupedBookings = <String, List<Map<String, dynamic>>>{}.obs;
  // var travelId = 0.obs;

  @override
  void onInit() {
    pickupController = TextEditingController();
    dropoffController = TextEditingController();
    passengersController = TextEditingController();
    super.onInit();
  }

  verifyBooking() {
    if (pickupController.text.isEmpty) {
      customSnackbar('Error', 'Pickup location cannot be empty', 'error');
      return false;
    }
    if (dropoffController.text.isEmpty) {
      customSnackbar('Error', 'Dropoff location cannot be empty', 'error');
      return false;
    }
    if (passengersController.text.isEmpty) {
      customSnackbar('Error', 'Number of passengers cannot be empty', 'error');
      return false;
    }
    return true;
  }

  Future<List<Map<String, dynamic>>> fetchBookingsForScheduler() async {
    String? schedulerId = await storage.read(key: "user_id");
    print('Logged in user id: $schedulerId');

    if (schedulerId == null) {
      print("Scheduler ID not found");
      return [];
    }

    final response = await http.get(
      Uri.parse("$baseUrl/fetch_bookings.php?scheduler_id=$schedulerId"),
      headers: {
        "Content-Type": "applicati on/x-www-form-urlencoded",
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      // return List<Map<String, dynamic>>.from(data);
      List<Map<String, dynamic>> bookings =
          List<Map<String, dynamic>>.from(data);

      // Group bookings by drop-off location
      var grouped = <String, List<Map<String, dynamic>>>{};
      for (var booking in bookings) {
        String dropOff =
            "${booking["travel_destination"]} | ${booking["travel_times"]}" ??
                "Unknown";
        grouped.putIfAbsent(dropOff, () => []).add(booking);
      }

      // Convert grouped map into a list of maps
      List<Map<String, dynamic>> groupedList = grouped.entries.map((entry) {
        return {
          "drop_off_location": entry.key,
          "bookings": entry.value,
        };
      }).toList();
      return groupedList;
    } else {
      print("Error fetching bookings: ${response.body}");
      return [];
    }
  }

  Future<void> createBooking(String? travel_id) async {
    String? user_id = await storage.read(key: "user_id");
    // String? travel_id = await storage.read(key: "travel_identity");

    if (travel_id == null || user_id == null) {
      print("Error: Missing user_id $user_id");
      print("Error: Missing travel_id $travel_id");
      return;
    }

    print('User ID: $user_id');
    print('Travel ID: $travel_id');

    final response =
        await http.post(Uri.parse("$baseUrl/book_travel.php"), headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    }, body: {
      "travel_id": travel_id,
      "user_id": user_id,
      "pick_up_location": pickupController.text,
      "drop_off_location": dropoffController.text,
      "number_of_passengers": passengersController.text,
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data["success"] == true) {
        customSnackbar('Success', '${data['message']}', 'success');
        Get.toNamed('/request_page');
      } else {
        customSnackbar('Error', '${data['message']}', 'error');
      }
    }
  }
}
