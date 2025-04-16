import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UpdateBookingStatusController extends GetxController {
  Future<void> updateBookingStatus(int bookingId, String status) async {
    // Replace with your actual PHP file URL
    final String baseUrl = "https://localhost/flutter/ihike";
    final String externalUrl = "http://192.168.1.97/flutter/ihike";
    print('Status from desptchController: $status');
    print('Booking ID from desptchController: $bookingId');

    try {
      var response = await http.post(
        Uri.parse('$baseUrl/booking_status_update.php'),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: {
          'booking_id': bookingId.toString(),
          'status': status,
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
  void onAcceptRide(int bookingId, String status) {
    updateBookingStatus(bookingId, status);
  }
}
