import 'dart:convert';
import 'dart:developer';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/data/models/selectionPopupModel/category_selection_popup_model.dart';
import 'package:recquest_21/presentation/mainhome_page/models/mainhome_item_model.dart';
import 'package:recquest_21/presentation/map_view_screen/models/map_view_model.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/utils/background_controller.dart';

class MapViewController extends GetxController {
  TextEditingController searchController = TextEditingController();
  Rx<MapViewModel> mapViewModelObj = MapViewModel().obs;
  var isDataLoading = false.obs;

  final List<Marker> markers = <Marker>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getCategories();
    getEvents();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  getCategories() async {
    APIHandler apiClient = APIHandler();
    try {
      isDataLoading(true);
      dynamic response =
          await apiClient.get('/getCategories', isAuthenticated: true);
      final List result = json.decode(response.data);
      print(result);
      List<CategorySelectionPopupModel> list =
          List<CategorySelectionPopupModel>.from(
              result.map((i) => CategorySelectionPopupModel.fromJson(i)));
      mapViewModelObj.value.categoryItemList.value = list;
      // mapViewModelObj.value.categoryItemList.clear();
      // list.forEach((value) {
      //   mapViewModelObj.value.categoryItemList.add(CategorySelectionPopupModel(
      //     id: value.id,
      //     name: value.name.toString(),
      //     slug: value.slug.toString(),
      //     status: value.status.toString(),
      //     image: value.image.toString(),
      //   ));
      // });
      // print(mapViewModelObj.value.categoryItemList);
      // return mapViewModelObj.value.categoryItemList;
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
      throw Exception('Failed to load data');
    } finally {
      isDataLoading(false);
    }
  }

  getEvents() async {
    await BackgroundController.instance.updateLocation();
    APIHandler apiClient = APIHandler();

    try {
      isDataLoading(true);
      dynamic locDataObj = {
        "latitude": BackgroundController.instance.latitude,
        "longitude": BackgroundController.instance.longitude,
        "distance": 1
      };

      print(locDataObj);
      dynamic response = await apiClient.post('/getEventsByDistance',
          isAuthenticated: true, data: locDataObj);

      final List result = json.decode(response.data);

      List<MainhomeItemModel> list = List<MainhomeItemModel>.from(
          result.map((i) => MainhomeItemModel.fromJson(i)));
      for (var event in list) {
        print(event);
        // Add a marker to the map
        markers.add(Marker(
          markerId: MarkerId(event.id.toString()),
          position: LatLng(event.latitude!, event.longitude!),
          infoWindow: InfoWindow(
            title: event.title.toString(),
            snippet: event.venue.toString() +
                " " +
                DateFormat.yMMMd()
                    .format(DateTime.parse(event.date.toString())) +
                " " +
                DateFormat.jm().format(DateTime.parse(event.date.toString())),
          ),
        ));
      }
      mapViewModelObj.value.mapViewItemList.value = list;
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
      throw Exception('Failed to load data');
    } finally {
      isDataLoading(false);
    }
  }

  getEventsByCategory(int cat) async {
    await BackgroundController.instance.updateLocation();
    APIHandler apiClient = APIHandler();

    try {
      isDataLoading(true);
      dynamic locDataObj = {
        "latitude": BackgroundController.instance.latitude,
        "longitude": BackgroundController.instance.longitude,
        "distance": 1,
        "category_id": cat
      };

      print(locDataObj);
      dynamic response = await apiClient.post('/getEventsByCategory',
          isAuthenticated: true, data: locDataObj);
      mapViewModelObj.value.mapViewItemList.clear();
      final List result = json.decode(response.data);

      List<MainhomeItemModel> list = List<MainhomeItemModel>.from(
          result.map((i) => MainhomeItemModel.fromJson(i)));
      markers.clear();
      for (var event in list) {
        print(event);
        // Add a marker to the map
        markers.add(Marker(
          markerId: MarkerId(event.id.toString()),
          position: LatLng(event.latitude!, event.longitude!),
          infoWindow: InfoWindow(
            title: event.title.toString(),
            snippet: event.venue.toString() +
                " " +
                DateFormat.yMMMd()
                    .format(DateTime.parse(event.date.toString())) +
                " " +
                DateFormat.jm().format(DateTime.parse(event.date.toString())),
          ),
        ));
      }
      mapViewModelObj.value.mapViewItemList.value = list;
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
      throw Exception('Failed to load data');
    } finally {
      isDataLoading(false);
    }
  }
}
