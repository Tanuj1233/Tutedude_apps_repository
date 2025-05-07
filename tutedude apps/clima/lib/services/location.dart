import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;

  Future<List> getCurrentLocation() async {
    try {
      Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      double latitude = position.latitude;
      double longitude = position.longitude;
      return [latitude, longitude];
    } catch (e) {
      print(e);
      return [0.0, 0.0]; // Return default values in case of error
    }
  }
}
