import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:recquest_21/utils/background_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  // globally accessible over the application
  static AuthController instance = Get.find();

// email, password, name...
  late Rx<User?> _user;
  dynamic signupObj;
  dynamic loggeduser;

  FirebaseAuth auth = FirebaseAuth.instance;
  final prefs = SharedPreferences.getInstance();

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);

    // Our user would be notified
    _user.bindStream(auth.userChanges());

    // this funtion will be notified when the user was changed, loggedin or logged out
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.toNamed(AppRoutes.onboardingOneScreen);
    } else {
      Get.toNamed(AppRoutes.mainhomeContainerScreen);
    }
  }

  Future<UserCredential?>? register(String email, password) async {
    APIHandler apiClient = APIHandler();
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userCredential) async {
        dynamic signupObj = {
          "email": userCredential.user?.email,
          "loggeduser": userCredential.user?.uid
        };
        await apiClient.post('/firebaseUpdate', data: signupObj);
      });
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: TextStyle(color: Colors.white)));
    }
    return null;
  }

  Future<UserCredential>? login(String email, password) {
    try {
      return auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "Login User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account login failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: TextStyle(color: Colors.white)));
    }
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  createaccount() async {
    try {
      APIHandler apiClient = APIHandler();

      dynamic signupObj = {
        // "firstname": controller.firstName.text,
        // "lastname": controller.lastName.text,
        // "email": controller.email.text,
        // "password": controller.password.text,
        // "password_confirmation": controller.passwordConfirmation.text,
        // "phone": controller.phone.text
      };

      dynamic response = await apiClient.post('/register', data: signupObj);

      // sample response
      // {
      //     "statusCode": "200",
      //     "message": "OTP sent to your email address",
      //     "email_otp_status": "email otp sent"
      // }
      dynamic responseData = response.data;
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }

  accountCheck(user) async {
    try {
      signupObj.uid = user.uid;
      print(signupObj);
      APIHandler apiClient = APIHandler();

      dynamic userObj = {"uid": user, "signup": signupObj};

      dynamic response =
          await apiClient.post('/registerFirebase', data: userObj);
      print(response);
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    print(localStorage.getString("access_token"));
    APIHandler apiClient = APIHandler();
    dynamic response = await apiClient.post('/refresh', isAuthenticated: true);
    dynamic responseData = response.data;
    print(responseData);
  }

  tokenRefresh(User user) async {
    final prefs = await SharedPreferences.getInstance();
    APIHandler apiClient = APIHandler();
    try {
      dynamic signupObj = {"email": user.email, "loggeduser": user.uid};
      dynamic response = await apiClient.post('/refresh', data: signupObj);
      dynamic responseData = response.data;
      prefs.setString('access_token', responseData['access_token']);
      prefs.setInt('id', responseData['user']['id']);
      prefs.setString('firstname', responseData['user']['firstname']);
      prefs.setString('email', responseData['user']['email']);
      BackgroundController.instance.uid.value = responseData['user']['id'];
      MyProfileModel userprofile = MyProfileModel.fromJson(response.data);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText:
              Text(e.toString(), style: TextStyle(color: Colors.white)));
    }
    return null;
  }
}
