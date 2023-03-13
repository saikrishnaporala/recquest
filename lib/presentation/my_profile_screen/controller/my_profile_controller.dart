import 'package:basic_utils/basic_utils.dart';
import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/my_profile_screen/models/my_profile_model.dart';
import 'dart:developer';

class MyProfileController extends GetxController {
  Rx<String> firstname = "".obs;
  Rx<String> email = "".obs;
  Rx<String> about = "".obs;
  Rx<MyProfileModel> myProfileModelObj = MyProfileModel().obs;

  var isDataLoading = false;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getUserProfile();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getUserProfile() async {
    APIHandler apiClient = APIHandler();

    try {
      dynamic response =
          await apiClient.get('/user-profile', isAuthenticated: true);

      dynamic responseData = response.data;
      // MyProfileModel userprofile = MyProfileModel.fromJson(response.data);
      // firstname = StringUtils.capitalize(responseData['firstname']);
      firstname.value = StringUtils.capitalize(responseData['firstname']);
      email.value = responseData['email'];
      about.value = responseData['about'];
      myProfileModelObj.value = MyProfileModel.fromJson(response.data);
      print(myProfileModelObj);
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      // isDataLoading;
    }
  }
}
