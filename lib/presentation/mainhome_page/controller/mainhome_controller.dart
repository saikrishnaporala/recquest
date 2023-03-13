import 'dart:convert';

import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/mainhome_page/models/mainhome_model.dart';
import 'package:recquest_21/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:recquest_21/utils/background_controller.dart';

import '../models/mainhome_item_model.dart';
import 'dart:developer';

import 'package:get/get.dart';

class MainhomeController extends GetxController {
  MainhomeController(this.mainhomeModelObj);

  Rx<MainhomeModel> mainhomeModelObj;

  Rx<MainhomeItemModel> mainhomeItemModel = MainhomeItemModel().obs;
  Rx<MyProfileModel> myProfileModelObj = MyProfileModel().obs;
  RxString address1 = "".obs;
  MainhomeItemModel? itemModel;
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    mainhomeModelObj.value.mainhomeItemList.clear();
    super.onInit();
    await getApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<MainhomeItemModel>> getApi() async {
    await BackgroundController.instance.updateLocation();
    APIHandler apiClient = APIHandler();
    List<MainhomeItemModel> list = [];
    try {
      isDataLoading(true);
      dynamic locDataObj = {
        "latitude": BackgroundController.instance.latitude,
        "longitude": BackgroundController.instance.longitude,
        "distance": 5
      };

      print(locDataObj);
      dynamic response =
          await apiClient.get('/eventsByLoggedInUser', isAuthenticated: true);

      if (response.data.length > 0) {
        final List result = json.decode(response.data);
        list = List<MainhomeItemModel>.from(
            result.map((i) => MainhomeItemModel.fromJson(i)));
      }

      // dynamic eventFav = await apiClient.get('/eventsByLoggedInUserFav',
      //     isAuthenticated: true);

      // if (eventFav.data.length > 0) {
      //   final List eventFavResult = json.decode(eventFav.data);
      //   list = List<MainhomeItemModel>.from(
      //       eventFavResult.map((i) => MainhomeItemModel.fromJson(i)));
      // }

      return list;
      // mainhomeModelObj.value.mainhomeItemList.value = list;
      // mainhomeModelObj.value.mainhomeItemList
      //     .forEach((element) => print(element.title));
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
      throw Exception('Failed to load data');
    } finally {
      isDataLoading(false);
    }
  }
}
