import 'dart:async';

import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/sign_up_verification_screen/models/sign_up_verification_model.dart';
import 'package:flutter/material.dart';

class SignUpVerificationController extends GetxController {
  TextEditingController otpinputController = TextEditingController();

  Rx<SignUpVerificationModel> signUpVerificationModelObj =
      SignUpVerificationModel().obs;

  Timer? _timer;
  int remainingSeconds = 1;
  // Rx<String> time = "00.00".obs;
  final time = '00.00'.obs;
  var isEnabled = false.obs;

  @override
  void onReady() {
    super.onReady();
    _startTimer(10);
  }

  @override
  void onClose() {
    super.onClose();
    otpinputController.dispose();
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        print("Close timer");
        isEnabled.value = true;
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
