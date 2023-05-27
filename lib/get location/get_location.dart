import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

import '../controllers/get_location_controller.dart';


class GetLocation extends StatelessWidget {
  final GetLocationController _LocationController = Get.put(GetLocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              if (_LocationController.currentPosition.value == null) {
                return CircularProgressIndicator();
              } else {
                final position = _LocationController.currentPosition.value!;
                return Text(
                  "Latitude: ${position.latitude}\nLongitude: ${position.longitude}",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                );
              }
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _LocationController.getCurrentLocation(),
              child: Text("Get Current Location"),
            ),
          ],
        ),
      ),
    );
  }
}