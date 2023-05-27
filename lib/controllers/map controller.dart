import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MapController extends GetxController {
  final currentPosition = Rx<Position?>(null);

  @override
  void onInit() {
    super.onInit();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {


    try{
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        final position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        currentPosition.value = position;
      }
      print("it must worked"); // its worked until here
    }
    catch(e){
      print("this is why map dont work : $e");
    }
  }
}