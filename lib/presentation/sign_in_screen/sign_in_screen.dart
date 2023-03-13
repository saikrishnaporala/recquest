import 'package:firebase_auth/firebase_auth.dart';
import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/utils/auth_controller.dart';
import 'package:recquest_21/utils/authentication.dart';
import 'package:recquest_21/utils/background_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../my_profile_screen/models/my_profile_model.dart';
import 'controller/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/core/utils/validation_functions.dart';
import 'package:recquest_21/widgets/custom_button.dart';
import 'package:recquest_21/widgets/custom_icon_button.dart';
import 'package:recquest_21/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignInScreen extends GetWidget<SignInController> {
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.emailController.text = 'saikrishnaporala@gmail.com';
    controller.passwordOneController.text = 'sksg@1010';
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.gray10001,
            body: Form(
                key: signInKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Container(
                    width: size.width,
                    padding:
                        getPadding(left: 17, top: 54, right: 17, bottom: 54),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                              svgPath: ImageConstant.imgRecquestlowerrbubble300,
                              height: getSize(118.00),
                              width: getSize(118.00),
                              margin: getMargin(left: 3)),
                          Padding(
                              padding: getPadding(left: 1, top: 12),
                              child: Text("lbl_hello_there".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansBold24)),
                          Padding(
                              padding: getPadding(left: 1, top: 13),
                              child: Text("msg_login_or_signup".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansSemiBold12)),
                          Padding(
                              padding: getPadding(left: 1, top: 14),
                              child: Text("lbl_your_email".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansSemiBold12)),
                          CustomTextFormField(
                              width: 340,
                              focusNode: FocusNode(),
                              controller: controller.emailController,
                              hintText: "msg_youremail_gmail_com".tr,
                              margin: getMargin(left: 1, top: 5),
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email";
                                }
                                return null;
                              }),
                          Padding(
                              padding: getPadding(left: 3, top: 31),
                              child: Text("lbl_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansSemiBold12)),
                          Obx(() => CustomTextFormField(
                              width: 338,
                              focusNode: FocusNode(),
                              controller: controller.passwordOneController,
                              hintText: "lbl".tr,
                              margin: getMargin(left: 3, top: 3),
                              padding: TextFormFieldPadding.PaddingT12,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              suffix: InkWell(
                                  onTap: () {
                                    controller.isShowPassword.value =
                                        !controller.isShowPassword.value;
                                  },
                                  child: Container(
                                      margin: getMargin(
                                          left: 30,
                                          top: 13,
                                          right: 16,
                                          bottom: 13),
                                      child: CustomImageView(
                                          svgPath:
                                              controller.isShowPassword.value
                                                  ? ImageConstant
                                                      .imgEyeBlueGray30001
                                                  : ImageConstant
                                                      .imgEyeBlueGray30001))),
                              suffixConstraints: BoxConstraints(
                                  maxHeight: getVerticalSize(52.00)),
                              validator: (value) {
                                if (value == null ||
                                    (!isValidPassword(value,
                                        isRequired: true))) {
                                  return "Please enter valid password";
                                }
                                return null;
                              },
                              isObscureText: !controller.isShowPassword.value)),
                          Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtForgotPassword();
                                  },
                                  child: Padding(
                                      padding: getPadding(top: 17),
                                      child: Text("msg_forgot_password".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtNotoSansSemiBold12
                                              .copyWith(
                                                  height: getVerticalSize(
                                                      1.11)))))),
                          CustomButton(
                              height: 48,
                              width: 338,
                              text: "lbl_login".tr.toUpperCase(),
                              margin: getMargin(left: 3, top: 14),
                              shape: ButtonShape.RoundedBorder14,
                              padding: ButtonPadding.PaddingAll9,
                              fontStyle: ButtonFontStyle.NotoSansBold16,
                              onTap: onTapLogin),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: getPadding(top: 27),
                                  child: Text("lbl_or_login_with".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtNotoSansMedium16))),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: getPadding(top: 23),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FutureBuilder(
                                          future: Authentication
                                              .initializeFirebase(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasError) {
                                              return Text(
                                                  'Error initializing Firebase');
                                            } else if (snapshot
                                                    .connectionState ==
                                                ConnectionState.done) {
                                              return CustomIconButton(
                                                  height: 60,
                                                  width: 60,
                                                  padding: IconButtonPadding
                                                      .PaddingAll12,
                                                  onTap: () {
                                                    onTapBtnGoogle(context);
                                                  },
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgGoogle));
                                            }
                                            return CircularProgressIndicator();
                                          },
                                        ),
                                        FutureBuilder(
                                          future: Authentication
                                              .initializeFirebase(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasError) {
                                              return Text(
                                                  'Error initializing Firebase');
                                            } else if (snapshot
                                                    .connectionState ==
                                                ConnectionState.done) {
                                              return CustomIconButton(
                                                  height: 60,
                                                  width: 60,
                                                  margin: getMargin(left: 40),
                                                  padding: IconButtonPadding
                                                      .PaddingAll12,
                                                  onTap: () {
                                                    onTapBtnFacebook(context);
                                                  },
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgFacebook));
                                            }
                                            return CircularProgressIndicator();
                                          },
                                        ),
                                      ]))),
                          Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtDonthaveanaccount();
                                  },
                                  child: Padding(
                                      padding: getPadding(top: 26, bottom: 5),
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "msg_don_t_have_an_account2"
                                                        .tr,
                                                style: TextStyle(
                                                    color:
                                                        ColorConstant.black900,
                                                    fontSize: getFontSize(15),
                                                    fontFamily: 'Asap',
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.20)),
                                            TextSpan(
                                                text: "lbl_sign_up".tr,
                                                style: TextStyle(
                                                    color:
                                                        ColorConstant.pink80001,
                                                    fontSize: getFontSize(15),
                                                    fontFamily: 'Asap',
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.20))
                                          ]),
                                          textAlign: TextAlign.left))))
                        ])))));
  }

  onTapTxtForgotPassword() {
    Get.toNamed(AppRoutes.forgotPasswordScreen);
  }

  onTapLogin() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      APIHandler apiClient = APIHandler();
      BackgroundController bc = new BackgroundController();

      dynamic loginObj = {
        'email': controller.emailController.text,
        'password': controller.passwordOneController.text,
      };

      try {
        dynamic response = await apiClient.post('/login', data: loginObj);

        dynamic responseData = response.data;
        if (responseData['status_code'] == 401) {
          Get.snackbar('Error', responseData.error.toString());
        } else {
          if (responseData['status_code'] == 422) {
            Get.snackbar('Error', responseData.error.toString());
          } else {
            prefs.setString('access_token', responseData['access_token']);
            prefs.setInt('id', responseData['user']['id']);
            prefs.setString('firstname', responseData['user']['firstname']);
            prefs.setString('email', responseData['user']['email']);
            prefs.setString('password', controller.passwordOneController.text);
            BackgroundController.instance.uid.value =
                responseData['user']['id'];
            MyProfileModel userprofile =
                MyProfileModel.fromJson(response.data['user']);
            BackgroundController.instance.myProfileModelObj.value = userprofile;
            AuthController ac = new AuthController();
            final user = await ac.login(controller.emailController.text,
                controller.passwordOneController.text);
            if (user != null) {
              Get.toNamed(AppRoutes.mainhomeContainerScreen,
                  arguments: userprofile);
            }
          }
        }
      } catch (e) {
        print(e);
      }
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }

  onTapBtnGoogle(BuildContext context) async {
    try {
      dynamic user = await Authentication.signInWithGoogle(context: context);
      UserInfo userInfo = user.providerData[0];
      createAccount(userInfo, user.emailVerified);
      print(user);
    } catch (e) {
      print(e);
    }
  }

  onTapBtnFacebook(BuildContext context) async {
    // https: //recquest-rec.firebaseapp.com/__/auth/handler
    try {
      dynamic user = await Authentication.signInWithFacebook(context: context);
      UserInfo userInfo = user.providerData[0];
      createAccount(userInfo, user.emailVerified);
      print(user);
    } catch (e) {
      print(e);
    }
    // 2446835385464359
    // 557f95cc48f7c2e467f1df598e5bc49a
    // https://recquest-rec.firebaseapp.com/__/auth/handler
    // await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
    //   //TODO Actions to be performed after signin
    // }).catchError((onError) {
    //   Get.snackbar('Error', onError.toString());
    // });
  }

  onTapTxtDonthaveanaccount() {
    Get.toNamed(AppRoutes.signUpScreen);
  }

  createAccount(userinfo, emailVerified) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      APIHandler apiClient = APIHandler();

      dynamic signupObj = {
        "firstname": userinfo.displayName,
        "lastname": "",
        "email": userinfo.email,
        "password": userinfo.uid,
        "password_confirmation": userinfo.uid,
        "phone": "",
        "uid": userinfo.uid,
        "emailVerified": emailVerified,
        "photoURL": userinfo.photoURL,
        "providerId": userinfo.providerId
      };

      print(signupObj);
      dynamic response =
          await apiClient.post('/registerFromFirebase', data: signupObj);

      dynamic responseData = response.data;
      print(responseData);
      prefs.setString(
          'access_token', responseData['token']['original']['access_token']);
      prefs.setString('fullName', userinfo.displayName);
      prefs.setString('email', userinfo.email);
      prefs.setInt('id', responseData['token']['original']['user']['id']);

      prefs.setString('firstname', responseData['user']['firstname']);
      prefs.setString('email', responseData['user']['email']);
      prefs.setString('password', controller.passwordOneController.text);
      BackgroundController.instance.uid.value =
          responseData['token']['original']['user']['id'];
      MyProfileModel userprofile =
          MyProfileModel.fromJson(responseData['token']['original']['user']);
      BackgroundController.instance.myProfileModelObj.value = userprofile;
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }
}
