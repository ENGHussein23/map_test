import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:map_test/controllers/get_location_controller.dart';

import '../controllers/map controller.dart';

class MapWidget extends StatelessWidget {
  final MapController _mapController = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return

      Container(
        child: Obx(() {
          if (_mapController.currentPosition.value == null) {
            return CircularProgressIndicator();
          } else {
            final position = _mapController.currentPosition.value!;
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('my_location'),
                  position: LatLng(position.latitude, position.longitude),
                  infoWindow: InfoWindow(title: 'My Location'),
                ),
              },
            );
          }
        }),
      );
  }
}