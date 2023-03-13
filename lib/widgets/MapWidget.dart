import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recquest_21/presentation/mainhome_page/controller/mainhome_controller.dart';
import 'package:recquest_21/presentation/mainhome_page/models/mainhome_item_model.dart';
import 'package:recquest_21/presentation/map_view_screen/controller/map_view_controller.dart';
import 'package:recquest_21/utils/background_controller.dart';

class MapWidget extends StatefulWidget {
  MapWidget({Key? key, required this.eventslist}) : super(key: key);
  final List<MainhomeItemModel> eventslist;
  @override
  _MapWidgetState createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController mapController;

  // Define a set of markers
  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    List<MainhomeItemModel> userList = widget.eventslist;
    _markers.clear();
    for (var event in userList) {
      print(event);
      // Add a marker to the map
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId(event.id.toString()),
            position: LatLng(event.latitude!, event.longitude!),
            infoWindow: InfoWindow(
              title: event.title.toString(),
              snippet: event.content,
            ),
          ),
        );
      });
    }
    return GoogleMap(
        // onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(BackgroundController.instance.latitude,
              BackgroundController.instance.longitude),
          zoom: 17.0,
        ),
        markers: _markers);
  }
}
