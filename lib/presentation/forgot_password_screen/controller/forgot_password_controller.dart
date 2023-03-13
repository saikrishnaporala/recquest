import 'dart:async';

import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/forgot_password_screen/models/forgot_password_model.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  Rx<ForgotPasswordModel> forgotPasswordModelObj = ForgotPasswordModel().obs;

  Timer? _timer;
  int remainingSeconds = 1;
  Rx<String> time = "00.00".obs;
  // final time = '00.00'.obs;

  @override
  void onReady() {
    super.onReady();
    _startTimer(900);
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        time.value = minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainingSeconds--;
      }
    });
  }
}
