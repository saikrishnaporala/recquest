import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/account_information_screen/models/account_information_model.dart';
import 'package:flutter/material.dart';

class AccountInformationController extends GetxController {
  TextEditingController password = TextEditingController();

  TextEditingController password_confirmation = TextEditingController();

  Rx<AccountInformationModel> accountInformationModelObj =
      AccountInformationModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    password.dispose();
    password_confirmation.dispose();
  }
}
