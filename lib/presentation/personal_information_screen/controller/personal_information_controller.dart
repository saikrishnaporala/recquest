import 'dart:developer';

import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/personal_information_screen/models/personal_information_model.dart';
import 'package:flutter/material.dart';

class PersonalInformationController extends GetxController {
  TextEditingController firstname = TextEditingController();

  TextEditingController lastname = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController dob = TextEditingController();

  TextEditingController gender = TextEditingController();

  TextEditingController about = TextEditingController();

  Rx<PersonalInformationModel> personalInformationModelObj =
      PersonalInformationModel().obs;

  SelectionPopupModel? selectedDropDownValue;
  // @override
  // void initState() {
  //   dateInput.text = ""; //set the initial value of text field
  //   super.initState();
  // }

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
    firstname.dispose();
    lastname.dispose();
    email.dispose();
    dob.dispose();
    gender.dispose();
    about.dispose();
  }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    personalInformationModelObj.value.dropdownItemList.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    personalInformationModelObj.value.dropdownItemList.refresh();
  }

  getUserProfile() async {
    APIHandler apiClient = APIHandler();

    try {
      dynamic response =
          await apiClient.get('/user-profile', isAuthenticated: true);

      dynamic responseData = response.data;
      firstname.text = responseData['firstname'];
      lastname.text = responseData['lastname'];
      gender.text = responseData['gender'];
      email.text = responseData['email'];
      about.text = responseData['about'];
      personalInformationModelObj.value.dob.value = responseData['dob'];
      for (final e in personalInformationModelObj.value.dropdownItemList) {
        print(e.title.toLowerCase());
        if (e.title.toLowerCase() == responseData['gender']) {
          e.isSelected = true;
          e.value = e.id;
          onSelected(e);
          break;
        }
      }
      print(personalInformationModelObj.value.dropdownItemList);
      // personalInformationModelObj.value.dropdownItemList =
      // print(responseData);
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      // isDataLoading;
    }
  }
}
