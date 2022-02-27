import 'package:geolocator/geolocator.dart';

class Location {
  // Instance variables
  double _latitude;
  double _longitude;

  // asynchronous programming
  Future<void> getCurrentLocation() async {
    //Request permission from the user.
    LocationPermission permission;
    Position position;
    try {
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever ||
          permission == null) {
        permission = await Geolocator.requestPermission();
      }
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      this._latitude = position.latitude;
      this._longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  // Getters
  double getLatitude() {
    return _latitude;
  }

  double getLongitude() {
    return _longitude;
  }
}
