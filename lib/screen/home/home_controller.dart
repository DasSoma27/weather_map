import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../model/weathermodel.dart';

class HomeController extends GetxController {
  var weatherList = <Weather>[].obs;
  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();

  final CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(17.4065, 78.4772),
    zoom: 11.0,
  );

  final Rx<LatLng> selectedLocation = const LatLng(0.0, 0.0).obs;
  final RxString weather = ''.obs;

  Future<void> fetchWeather(double lat, double lon) async {
    const apiKey = 'bd5e378503939ddaee76f12ad7a97608';
    final url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {

        final data = json.decode(response.body);
        final weather = Weather.fromJson(data);
        weatherList.clear(); // Clear existing data
        weatherList.add(weather); // Add new data
      } else if (response.statusCode == 401) {
        Get.snackbar("Error", "Unauthorized: Invalid API Key");
      } else {
        Get.snackbar(
            "Error", "Failed to fetch weather data: ${response.statusCode}");
      }
    } catch (e) {
      print('Exception occurred: $e');
      Get.snackbar("Error", "Failed to make API call");
    } finally {}
  }

  void onMapClicked(LatLng location) {
    selectedLocation.value = location;
    fetchWeather(location.latitude, location.longitude);
  }
}
