import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controller/map_view_controller.dart';
import '../models/map_view_item_model.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';

// ignore: must_be_immutable
class MapViewItemWidget extends StatelessWidget {
  MapViewItemWidget(this.mapViewItemModelObj);

  MapViewItemModel mapViewItemModelObj;

  var controller = Get.find<MapViewController>();

  final List<Marker> _markers = [
    Marker(
      markerId: MarkerId('marker1'),
      position: LatLng(37.7749, -122.4194),
      infoWindow: InfoWindow(title: 'Marker 1'),
    ),
    Marker(
      markerId: MarkerId('marker2'),
      position: LatLng(37.7897, -122.4145),
      infoWindow: InfoWindow(title: 'Marker 2'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.7749, -122.4194),
                  zoom: 17,
                ),
                markers: Set<Marker>.of(_markers),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
