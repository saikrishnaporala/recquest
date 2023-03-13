import 'dart:async';

import 'package:geolocator/geolocator.dart';

class LocationService {
  StreamController<Position> _locationController =
      StreamController<Position>.broadcast();
  Stream<Position> get locationStream => _locationController.stream;

  LocationService() {
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          forceAndroidLocationManager: true);
      _locationController.add(position);
    } catch (e) {
      print(e);
    }
    Timer(Duration(minutes: 5), _getCurrentLocation);
  }

  //  _getCurrentLocation() async {
  //   GeolocationStatus geolocationStatus  = await Geolocator().checkGeolocationPermissionStatus();
  //   if (geolocationStatus == GeolocationStatus.denied) {
  //     // Show a message to the user explaining why the app needs access to location data
  //   } else {
  //     Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //     setState(() {
  //       _currentPosition = position;
  //     });
  //   }
  // }
}

// LocationService locationService = LocationService();
// locationService.locationStream.listen((Position position) {
//   print(position.latitude);
//   print(position.longitude);
// });