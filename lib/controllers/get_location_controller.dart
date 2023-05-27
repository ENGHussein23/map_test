import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class GetLocationController extends GetxController {
  Rx<Position?> currentPosition = Rx<Position?>(null);

  @override
  void onInit() {
    super.onInit();
    checkLocationPermission();
  }

  void checkLocationPermission() async {
    var status = await Permission.location.status;

    if (status.isDenied) {
      status = await Permission.location.request();
    }

    if (status.isGranted) {
      getCurrentLocation();
    }
  }

  void getCurrentLocation() async {
    try {
      final currentPositionData = await Geolocator.getCurrentPosition();
      currentPosition.value = currentPositionData;
      print("=================\n" + currentPosition.value.toString());
    } catch (e) {
      print("this is why it doesnt work $e");
    }
  }
}