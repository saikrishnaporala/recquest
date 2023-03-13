import 'dart:convert';
import 'dart:developer';

import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/following_screen/models/following_item_model.dart';
import 'package:recquest_21/presentation/following_screen/models/following_model.dart';

class FollowingController extends GetxController {
  Rx<FollowingModel> followingModelObj = FollowingModel().obs;
var isDataLoading = false.obs;
dynamic argData = Get.arguments;

@override
  Future<void> onInit() async {
    super.onInit();
    loadFollowers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadFollowers() async {
    print(argData);
    APIHandler apiClient = APIHandler();

    try {
      isDataLoading(true);
      dynamic reviewDataObj = {
        "event_id": argData.id,
      };

      dynamic response = await apiClient.post('/getFollowersByEvent',
          data: reviewDataObj, isAuthenticated: true);

      final List result = json.decode(response.data);

      List<FollowingItemModel> list = List<FollowingItemModel>.from(
          result.map((i) => FollowingItemModel.fromJson(i)));
      
      // return list;
      followingModelObj.value.followingItemList.clear();
      followingModelObj.value.followingItemList.value = list;
      
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
      throw Exception('Failed to load data');
    } finally {
      isDataLoading(false);
    }
  }
}
