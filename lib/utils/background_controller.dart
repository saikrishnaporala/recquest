import 'dart:convert';
import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:place_picker/place_picker.dart';
import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:recquest_21/services/LocationService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackgroundController extends GetxController {
  // globally accessible over the application
  static BackgroundController instance = Get.find();
  static BackgroundController get to => Get.find();

  RxString address = "".obs;
  RxInt uid = 0.obs;
  Rx<MyProfileModel> myProfileModelObj = MyProfileModel().obs;

  late Future<Position> _currentPosition;
  var isDataLoading = false.obs;
  late Future<Position> currentPosition; //  => _currentPosition;

  var locationPermission = false;
  var cameraPermission = false;
  var contactsPermission = false;
  var latitude = 0.00;
  var longitude = 0.00;
  @override
  Future<void> onInit() async {
    openLocationPermissionSettings()
        .then((_) => getLocation())
        .then((_) => openCameraPermissionSettings())
        .then((_) => checkContactsPermission());
    currentPosition = _getCurrentLocation();
    // await _getCurrentLocation();
    super.onInit();
  }

  void openCameraPermissionSettings() async {
    if (await Permission.camera.request().isGranted) {
      // Permission is already granted
      cameraPermission = true;
      return;
    }

    if (await Permission.camera.isPermanentlyDenied) {
      // The user has permanently denied the permission, take them to the app settings
      openAppSettings();
    } else {
      // The user has denied the permission, request it again
      await Permission.camera.request();
    }
  }

  Future<void> openLocationPermissionSettings() async {
    if (await Permission.location.request().isGranted) {
      // Permission is already granted
      locationPermission = true;
      return;
    }

    if (await Permission.location.isPermanentlyDenied) {
      // The user has permanently denied the permission, take them to the app settings
      openAppSettings();
    } else {
      // The user has denied the permission, request it again
      await Permission.location.request();
    }
  }

  void checkContactsPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      contactsPermission = true;
      // Permission is already granted
      // Do something with contacts
    } else {
      // Permission is not granted yet
      // Request permission
      if (await Permission.contacts.request().isGranted) {
        // Permission granted
        // Do something with contacts
        contactsPermission = true;
      } else {
        openAppSettings();
        // contactsPermission = false;
        // Permission not granted
        // Handle the situation
      }
    }
  }

  void getLocation() async {
    if (locationPermission == true) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
    } else {
      openLocationPermissionSettings();
    }
  }

  // Position? _position;
  Future<Position> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      } else {
        throw Exception('Error');
      }
    } else {
      // return await Geolocator.getCurrentPosition();
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        forceAndroidLocationManager: true,
      );
      latitude = position.latitude;
      longitude = position.longitude;
      // _currentPosition = position;
      return position;
    }
  }

  Future<bool> requestPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return Future.value(true);
    } else {
      requestPermission();
      return Future.value(false);
    }
  }

  Future<bool> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Show a message to the user explaining why the app needs access to location data
      return this.requestPermission();
    } else {
      return Future.value(true);
    }
  }

  Future<String> updateLocation() async {
    APIHandler apiClient = APIHandler();
    LocationService locationService = LocationService();
    final prefs = await SharedPreferences.getInstance();
    if (locationPermission == true) {
      locationService.locationStream.listen((Position position) async {
        print(position.latitude);
        print(position.longitude);
        List<Placemark> addressDetails = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        BackgroundController.instance.address.value =
            addressDetails[0].locality!;
        dynamic locationDataObj = {
          "latitude": position.latitude,
          "longitude": position.longitude
        };
        prefs.setDouble('latitude', position.latitude);
        prefs.setDouble('longitude', position.longitude);
        try {
          dynamic response = await apiClient.post('/updateLocation',
              data: locationDataObj, isAuthenticated: true);

          dynamic resondeData = response.data;
          print(resondeData['message']);
        } catch (e) {
          log('Error while getting data is $e');
          print('Error while getting data is $e');
          throw Exception('Failed to load data');
        } finally {
          isDataLoading(false);
        }
      });
    } else {
      openLocationPermissionSettings();
      updateLocation();
    }
    return BackgroundController.instance.address.value;
  }

  Future<LatLng> getCoordinates(String address) async {
    List<Location> locations = await locationFromAddress(address);
    return LatLng(locations[0].latitude, locations[0].longitude);
  }
}
