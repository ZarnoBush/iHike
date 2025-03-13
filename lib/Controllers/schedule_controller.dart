import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hike/Utils/custom_snacbar.dart';
import 'package:hike/Utils/loader.dart';
import 'package:http/http.dart' as http;

class ScheduleController extends GetxController {
  late TextEditingController? currentLocationController, destinationController;

  RxString selectedTime = 'Select Time'.obs; // Holds the selected time
  String? passengers = '2';
  // String? userId; // Add user_id variable

  @override
  void onInit() {
    super.onInit();
    currentLocationController = TextEditingController();
    destinationController = TextEditingController();
    
    // Initialize userId here, if applicable
    // userId = 'your_user_id_here'; // Replace with actual user_id assignment
  }

  @override
  void onClose() {
    super.onClose();
    currentLocationController!.dispose();
    destinationController!.dispose();
  }

  clear() {
    currentLocationController!.clear();
    destinationController!.clear();
  }

  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      selectedTime.value = picked.format(context); // Update UI
    }
  }

  Future<void> checkSchedule() async {
    if (currentLocationController!.text.isEmpty) {
      customSnackbar('Error', 'Please enter your pickup location', 'error');
    } else if (destinationController!.text.isEmpty) {
      customSnackbar('Error', 'Please enter your destination', 'error');
    } else if (passengers!.isEmpty) {
      customSnackbar('Error', 'Please enter number of passengers', 'error');
    } else {
      Get.showOverlay(asyncFunction: () => schedule(), loadingWidget: Loader());
    }
  }

  Future<void> schedule() async {
    

    final storage = GetStorage();
    int? userId = int.tryParse(storage.read('user_id') ?? ''); // Retrieve user_id
    print('User ID: $userId');

    if (userId == null) {
      Get.snackbar('Error', 'User ID not found. Please log in again.');
      return;
    }

    String? url = 'https://localhost/flutter/ihike/schedule_user.php';

    Map<String, dynamic> dataParams = {
      'user_id': userId.toString(), // Include user_id in the request
      'from': currentLocationController!.text,
      'to': destinationController!.text,
      'seats': passengers!,
      'time': selectedTime.value
    };

    try {
      var response = await http.post(Uri.parse(url), body: dataParams);
      if (response.statusCode == 200) {
        var res = await jsonDecode(response.body);
        if (res['success']) {
          customSnackbar('Success', res['message'], 'success');
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
