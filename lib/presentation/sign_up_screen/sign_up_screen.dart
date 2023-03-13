import 'package:geolocator/geolocator.dart';
import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:recquest_21/services/LocationService.dart';
import 'package:recquest_21/utils/auth_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/core/utils/validation_functions.dart';
import 'package:recquest_21/widgets/custom_button.dart';
import 'package:recquest_21/widgets/custom_icon_button.dart';
import 'package:recquest_21/widgets/custom_text_form_field.dart';
import 'package:recquest_21/domain/googleauth/google_auth_helper.dart';
import 'package:recquest_21/domain/facebookauth/facebook_auth_helper.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends GetWidget<SignUpController> {
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.firstName.text = 'sai';
    controller.lastName.text = 'krishna';
    controller.email.text = "saikrishnaporala@gmail.com";
    controller.phone.text = "9606796516";
    controller.password.text = 'sksg@1010';
    controller.passwordConfirmation.text = 'sksg@1010';
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.gray10001,
        body: Form(
          key: signUpKey,
          child: Container(
            width: size.width,
            padding: getPadding(left: 17, top: 19, right: 17, bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                    svgPath: ImageConstant.imgArrowleftBlack900,
                    height: getVerticalSize(16.00),
                    width: getHorizontalSize(20.00),
                    margin: getMargin(left: 3),
                    onTap: () {
                      onTapImgArrowleft();
                    }),
                CustomImageView(
                    svgPath: ImageConstant.imgRecquestlowerrbubble300,
                    height: getSize(118.00),
                    width: getSize(118.00),
                    margin: getMargin(left: 3, top: 18)),
                Padding(
                    padding: getPadding(left: 3, top: 5),
                    child: Text("lbl_sign_up2".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtNotoSansBold24
                            .copyWith(height: getVerticalSize(1.00)))),
                CustomTextFormField(
                    width: 340,
                    focusNode: FocusNode(),
                    controller: controller.firstName,
                    hintText: "lbl_first_name".tr,
                    margin: getMargin(left: 1, top: 10),
                    fontStyle: TextFormFieldFontStyle.AsapRomanRegular14,
                    validator: (value) {
                      if (!isText(value)) {
                        return "Please enter valid text";
                      }
                      return null;
                    }),
                CustomTextFormField(
                    width: 340,
                    focusNode: FocusNode(),
                    controller: controller.lastName,
                    hintText: "lbl_last_name".tr,
                    margin: getMargin(left: 1, top: 7),
                    fontStyle: TextFormFieldFontStyle.AsapRomanRegular14,
                    validator: (value) {
                      if (!isText(value)) {
                        return "Please enter valid text";
                      }
                      return null;
                    }),
                CustomTextFormField(
                  width: 340,
                  focusNode: FocusNode(),
                  controller: controller.phone,
                  hintText: "msg_mobile".tr,
                  margin: getMargin(left: 1, top: 6),
                  fontStyle: TextFormFieldFontStyle.AsapRomanRegular14,
                  textInputType: TextInputType.emailAddress,
                  // validator: (value) {
                  //   if (value == null ||
                  //       (!isValidEmail(value, isRequired: true))) {
                  //     return "Please enter valid Phone";
                  //   }
                  //   return null;
                  // },
                ),
                CustomTextFormField(
                    width: 340,
                    focusNode: FocusNode(),
                    controller: controller.email,
                    hintText: "msg_youremail_gmail_com".tr,
                    margin: getMargin(left: 1, top: 6),
                    fontStyle: TextFormFieldFontStyle.AsapRomanRegular14,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null ||
                          (!isValidEmail(value, isRequired: true))) {
                        return "Please enter valid email";
                      }
                      return null;
                    }),
                Obx(() => CustomTextFormField(
                    width: 340,
                    focusNode: FocusNode(),
                    controller: controller.password,
                    hintText: "lbl_password".tr,
                    margin: getMargin(left: 1, top: 6),
                    padding: TextFormFieldPadding.PaddingT12,
                    fontStyle: TextFormFieldFontStyle.AsapRomanRegular14,
                    textInputType: TextInputType.visiblePassword,
                    suffix: InkWell(
                        onTap: () {
                          controller.isShowPassword.value =
                              !controller.isShowPassword.value;
                        },
                        child: Container(
                            margin: getMargin(
                                left: 30, top: 13, right: 16, bottom: 13),
                            child: CustomImageView(
                                svgPath: controller.isShowPassword.value
                                    ? ImageConstant.imgEyeBlueGray30001
                                    : ImageConstant.imgEyeBlueGray30001))),
                    suffixConstraints:
                        BoxConstraints(maxHeight: getVerticalSize(52.00)),
                    validator: (value) {
                      if (value == null ||
                          (!isValidPassword(value, isRequired: true))) {
                        return "Please enter valid password";
                      }
                      return null;
                    },
                    isObscureText: !controller.isShowPassword.value)),
                Obx(() => CustomTextFormField(
                    width: 340,
                    focusNode: FocusNode(),
                    controller: controller.passwordConfirmation,
                    hintText: "msg_confirm_password".tr,
                    margin: getMargin(left: 1, top: 6),
                    padding: TextFormFieldPadding.PaddingT12,
                    fontStyle: TextFormFieldFontStyle.AsapRomanRegular14,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.visiblePassword,
                    suffix: InkWell(
                        onTap: () {
                          controller.isShowPassword1.value =
                              !controller.isShowPassword1.value;
                        },
                        child: Container(
                            margin: getMargin(
                                left: 30, top: 13, right: 21, bottom: 13),
                            child: CustomImageView(
                                svgPath: controller.isShowPassword1.value
                                    ? ImageConstant.imgEyeBlueGray30001
                                    : ImageConstant.imgEyeBlueGray30001))),
                    suffixConstraints:
                        BoxConstraints(maxHeight: getVerticalSize(52.00)),
                    validator: (value) {
                      if (value == null ||
                          (!isValidPassword(value, isRequired: true))) {
                        return "Please enter valid password";
                      }
                      return null;
                    },
                    isObscureText: !controller.isShowPassword1.value)),
                CustomButton(
                    height: 48,
                    width: 340,
                    text: "lbl_create_account".tr.toUpperCase(),
                    margin: getMargin(left: 1, top: 20),
                    shape: ButtonShape.RoundedBorder14,
                    padding: ButtonPadding.PaddingAll9,
                    fontStyle: ButtonFontStyle.NotoSansBold16,
                    onTap: onTapCreateaccount),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: getPadding(top: 12),
                        child: Text("lbl_or_login_with".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtNotoSansMedium16
                                .copyWith(height: getVerticalSize(1.04))))),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: getPadding(top: 23),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomIconButton(
                                  height: 60,
                                  width: 60,
                                  padding: IconButtonPadding.PaddingAll12,
                                  onTap: () {
                                    onTapBtnGoogle();
                                  },
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgGoogle)),
                              CustomIconButton(
                                  height: 60,
                                  width: 60,
                                  margin: getMargin(left: 40),
                                  padding: IconButtonPadding.PaddingAll15,
                                  onTap: () {
                                    onTapBtnFacebook();
                                  },
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgFacebook))
                            ]))),
                Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: () {
                          onTapTxtAlreadyhavean();
                        },
                        child: Padding(
                            padding: getPadding(top: 27, bottom: 5),
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "msg_already_have_an2".tr,
                                      style: TextStyle(
                                          color: ColorConstant.black900,
                                          fontSize: getFontSize(14),
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w500,
                                          height: getVerticalSize(1.00))),
                                  TextSpan(
                                      text: "lbl_sign_in".tr,
                                      style: TextStyle(
                                          color: ColorConstant.pink80001,
                                          fontSize: getFontSize(14),
                                          fontFamily: 'Noto Sans',
                                          fontWeight: FontWeight.w500,
                                          height: getVerticalSize(1.00)))
                                ]),
                                textAlign: TextAlign.left))))
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTapImgArrowleft() {
    Get.toNamed(AppRoutes.signInScreen);
  }

  onTapCreateaccount() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      APIHandler apiClient = APIHandler();
      var latitude = 0.00;
      var longitude = 0.00;
      LocationService locationService = LocationService();
      locationService.locationStream.listen((Position position) {
        latitude = position.latitude;
        longitude = position.longitude;
        print(position.latitude);
        print(position.longitude);
      });
      dynamic signupObj = {
        "firstname": controller.firstName.text,
        "lastname": controller.lastName.text,
        "email": controller.email.text,
        "password": controller.password.text,
        "password_confirmation": controller.passwordConfirmation.text,
        "mobile": controller.phone.text,
        "latitude": latitude,
        "longitude": longitude
      };

      SignUpModel s = SignUpModel.fromJson(signupObj);

      dynamic response = await apiClient.post('/register', data: signupObj);

      // sample response
      // {
      //     "statusCode": "200",
      //     "message": "OTP sent to your email address",
      //     "email_otp_status": "email otp sent"
      // }
      dynamic responseData = response.data;
      if (responseData['statusCode'] == "409") {
        Get.snackbar('Failure', responseData['message']);
      } else {
        prefs.setString('email', controller.email.text);
        prefs.setString('phone', controller.phone.text);
        prefs.setString('password', controller.password.text);
        Get.snackbar('Success', responseData['message']);
        Get.toNamed(AppRoutes.signUpVerificationScreen, arguments: s);
      }
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }

  onTapBtnGoogle() async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        Get.snackbar('Error', 'user data is empty');
      }
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapBtnFacebook() async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      Get.snackbar('Error', onError.toString());
    });
  }

  onTapTxtAlreadyhavean() {
    Get.toNamed(AppRoutes.signInScreen);
  }
}
