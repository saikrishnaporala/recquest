import 'dart:convert';
import 'dart:developer';

import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/mainhome_page/models/mainhome_item_model.dart';
import 'package:recquest_21/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:recquest_21/presentation/organizer_profile_about_screen/models/organizer_profile_about_model.dart';
import 'package:recquest_21/presentation/organizer_profile_about_screen/models/organizer_profile_reviews_model.dart';

class OrganizerProfileAboutController extends GetxController {
  Rx<OrganizerProfileAboutModel> organizerProfileAboutModelObj =
      OrganizerProfileAboutModel().obs;

  Rx<OrganizerProfileReviewsModel> organizerProfileReviewsModelObj =
      OrganizerProfileReviewsModel().obs;

  Rx<MainhomeItemModel> mainhomeItemModel = MainhomeItemModel().obs;
  MyProfileModel myProfileModelObj = MyProfileModel();
  MainhomeItemModel? itemModel;
  var isDataLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<MainhomeItemModel>> getEventsByUser(oid) async {
    
    APIHandler apiClient = APIHandler();

    try {
      dynamic response =
          await apiClient.get('/eventsByUserId/$oid', isAuthenticated: true);

      final List result = json.decode(response.data);
      print(result);
      List<MainhomeItemModel> list = List<MainhomeItemModel>.from(
          result.map((i) => MainhomeItemModel.fromJson(i)));
      return list;
      // organizerProfileAboutModelObj.value.mainhomeItemList.clear();
      // print(organizerProfileAboutModelObj.value.mainhomeItemList.length);
      // print(list.length);
      // organizerProfileAboutModelObj.value.mainhomeItemList.value = list;
      // organizerProfileAboutModelObj.value.mainhomeItemList
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
