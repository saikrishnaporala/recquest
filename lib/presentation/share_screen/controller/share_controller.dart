import 'dart:convert';
import 'dart:developer';

import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:recquest_21/presentation/share_screen/models/share_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShareController extends GetxController {
  Rx<ShareModel> shareModelObj = ShareModel().obs;
  var isDataLoading = false.obs;

  var selectedUsers = [];

  @override
  void onInit() async {
    // await getUsers();
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

  getUsers() async {
    APIHandler apiClient = APIHandler();
    final prefs = await SharedPreferences.getInstance();
    try {
      isDataLoading(true);
      dynamic response = await apiClient.get('/users', isAuthenticated: true);
      final List result = response.data;
      shareModelObj.value.usersList.value = List<MyProfileModel>.from(
          result.map((i) => MyProfileModel.fromJson(i)));
      print(shareModelObj.value.usersList);
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
      throw Exception('Failed to load data');
    } finally {
      isDataLoading(false);
    }
  }
}
