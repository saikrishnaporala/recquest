import 'dart:convert';
import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:place_picker/place_picker.dart';
import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/data/models/selectionPopupModel/category_selection_popup_model.dart';
import 'package:recquest_21/presentation/create_events_screen/models/create_events_model.dart';
import 'package:flutter/material.dart';

class CreateEventsController extends GetxController {
  TextEditingController eventnametextController = TextEditingController();
  TextEditingController eventlocationtextController = TextEditingController();
  TextEditingController inputController = TextEditingController();

  Rx<CreateEventsModel> createEventsModelObj = CreateEventsModel().obs;

  SelectionPopupModel? selectedDropDownValue;
  var isDataLoading = false.obs;

  var location = ''.obs;

  void updateLocation(String newLocation) {
    print(newLocation);
    location.value = newLocation;
  }

  @override
  Future<void> onInit() async {
    print(createEventsModelObj.value.categoryList);
    await getCategories();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    eventnametextController.dispose();
    eventlocationtextController.dispose();
    inputController.dispose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    createEventsModelObj.value.categoryList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    createEventsModelObj.value.categoryList.refresh();
  }

  getCategories() async {
    APIHandler apiClient = APIHandler();
    print(createEventsModelObj.value.categoryList);
    try {
      isDataLoading(true);
      dynamic response =
          await apiClient.get('/getCategories', isAuthenticated: true);
      final List result = json.decode(response.data);
      List<CategorySelectionPopupModel> list =
          List<CategorySelectionPopupModel>.from(
              result.map((i) => CategorySelectionPopupModel.fromJson(i)));
      createEventsModelObj.value.categoryList.clear();
      list.forEach((value) {
        createEventsModelObj.value.categoryList.add(SelectionPopupModel(
            id: value.id,
            title: value.name.toString(),
            value: value.id,
            isSelected: false));
      });
      print(createEventsModelObj.value.categoryList);
      return createEventsModelObj.value.categoryList;
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
      throw Exception('Failed to load data');
    } finally {
      isDataLoading(false);
    }
  }
}
