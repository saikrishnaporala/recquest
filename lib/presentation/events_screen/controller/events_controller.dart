import 'dart:convert';
import 'dart:developer';

import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/events_screen/models/distance_model.dart';
import 'package:recquest_21/presentation/events_screen/models/events_model.dart';
import 'package:recquest_21/presentation/mainhome_page/models/mainhome_item_model.dart';
import 'package:recquest_21/presentation/mainhome_page/models/mainhome_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EventsController extends GetxController {
  Rx<EventsModel> eventsModelObj = EventsModel().obs;
  late Rx<MainhomeModel> mainhomeModelObj;
  var isDataLoading = false.obs;

  Rx<DistanceModel> distanceModelObj = DistanceModel().obs;

  int? selectedValue = 1;

  void onSelected(int value) {
    selectedValue = value;

    update();

    print(selectedValue);
  }

  @override
  Future<void> onInit() async {
    await getEvents();
    super.onInit();
    // eventsModelObj.value.eventsItemList.clear();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<MainhomeItemModel>> getEvents() async {
    APIHandler apiClient = APIHandler();
    final prefs = await SharedPreferences.getInstance();
    try {
      isDataLoading(true);
      dynamic locDataObj = {
        "latitude": prefs.getDouble('latitude'),
        "longitude": prefs.getDouble('longitude'),
      };
      dynamic response =
          await apiClient.get('/getEvents', isAuthenticated: true);
      final List result = json.decode(response.data);

      return List<MainhomeItemModel>.from(
          result.map((i) => MainhomeItemModel.fromJson(i)));
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
      throw Exception('Failed to load data');
    } finally {
      isDataLoading(false);
    }
  }
}
