import 'dart:convert';
import 'dart:developer';

import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/mainhome_page/models/mainhome_item_model.dart';
import 'package:recquest_21/presentation/mainhome_page/models/mainhome_model.dart';
import 'package:recquest_21/presentation/search_events_screen/models/search_events_model.dart';
import 'package:flutter/material.dart';

class SearchEventsController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<SearchEventsModel> searchEventsModelObj = SearchEventsModel().obs;
  late Rx<MainhomeModel> mainhomeModelObj;
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
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

  getEvents() async {
    APIHandler apiClient = APIHandler();

    try {
      isDataLoading(true);
      dynamic response =
          await apiClient.get('/getEvents', isAuthenticated: true);
      final List result = json.decode(response.data);

      List<MainhomeItemModel> list = List<MainhomeItemModel>.from(
          result.map((i) => MainhomeItemModel.fromJson(i)));

      searchEventsModelObj.value.searchEventsItemList.clear();
      searchEventsModelObj.value.searchEventsItemList.value = list;
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
      throw Exception('Failed to load data');
    } finally {
      isDataLoading(false);
    }
  }
}
