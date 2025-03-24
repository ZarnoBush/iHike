
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchTravelsController  extends GetxController{
    final String baseUrl = "https://localhost/flutter/ihike";

  Future<List<Map<String, dynamic>>> fetchTravels(String role) async {
  final response = await http.get(
    Uri.parse("$baseUrl/fetch_travels.php?role=$role"),
    headers: {"Content-Type": "application/x-www-form-urlencoded"},
  );

  if (response.statusCode == 200) {
    List<dynamic> data = await jsonDecode(response.body);
    return data.map((item) => item as Map<String, dynamic>).toList();
  } else {
    throw Exception("Failed to load travels");
  }
}

}