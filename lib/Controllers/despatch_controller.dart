import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DespatchController extends GetxController{

  Future<void> dispatchRide(int bookingId, int driverId) async {
  // Replace with your actual PHP file URL
  final String baseUrl = "https://localhost/flutter/ihike";
  print('Driver ID from desptchController: $driverId');
  print('Booking ID from desptchController: $bookingId');

  try {
    var response = await http.post(
      Uri.parse('$baseUrl/despatch.php'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",},
      body: {
        'booking_id': bookingId.toString(),
        'driver_id': driverId.toString(),
      },
    );

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      print("Response: ${responseData['message']}");
    } else {
      print("Failed to dispatch ride: ${response.statusCode}");
    }
  } catch (e) {
    print("Error: $e");
  }
}

// Example usage
void onAcceptRide(int bookingId, int driverId) {
  dispatchRide(bookingId, driverId);
}
}
