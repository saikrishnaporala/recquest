import 'package:recquest_21/api/api_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/core/utils/validation_functions.dart';
import 'package:recquest_21/widgets/custom_button.dart';
import 'package:recquest_21/widgets/custom_icon_button.dart';
import 'package:recquest_21/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends GetWidget<ForgotPasswordController> {
  GlobalKey<FormState> forgotPassword_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.emailController.text = "saikrishnaporala@gmail.com";
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.gray10001,
            body: Form(
                key: forgotPassword_key,
                child: Container(
                    width: size.width,
                    padding:
                        getPadding(left: 17, top: 19, right: 17, bottom: 19),
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
                              padding: getPadding(left: 3, top: 6),
                              child: Text("lbl_forgot_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansBold24.copyWith(
                                      height: getVerticalSize(1.00)))),
                          Container(
                              width: getHorizontalSize(279.00),
                              margin: getMargin(left: 1, top: 31),
                              child: Text("msg_please_enter_your".tr,
                                  maxLines: null,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16.copyWith(
                                      height: getVerticalSize(1.04)))),
                          CustomTextFormField(
                              width: 340,
                              focusNode: FocusNode(),
                              controller: controller.emailController,
                              hintText: "msg_youremail_gmail_com".tr,
                              margin: getMargin(left: 1, top: 27),
                              fontStyle:
                                  TextFormFieldFontStyle.AsapRomanRegular14,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email";
                                }
                                return null;
                              }),
                          CustomButton(
                              height: 48,
                              width: 340,
                              text: "lbl_continue2".tr.toUpperCase(),
                              margin: getMargin(left: 1, top: 29),
                              shape: ButtonShape.RoundedBorder14,
                              padding: ButtonPadding.PaddingAll9,
                              fontStyle: ButtonFontStyle.NotoSansBold16,
                              onTap: onTapContinue),
                          Spacer(),
                          Align(
                              alignment: Alignment.center,
                              child: Text("lbl_or_login_with".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16.copyWith(
                                      height: getVerticalSize(1.04)))),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: getPadding(top: 23),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomIconButton(
                                            height: 60,
                                            width: 60,
                                            padding:
                                                IconButtonPadding.PaddingAll12,
                                            onTap: () {
                                              onTapBtnGoogle();
                                            },
                                            child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgGoogle)),
                                        CustomIconButton(
                                            height: 60,
                                            width: 60,
                                            margin: getMargin(left: 40),
                                            padding:
                                                IconButtonPadding.PaddingAll15,
                                            onTap: () {
                                              onTapBtnFacebook();
                                            },
                                            child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgFacebook))
                                      ]))),
                          Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtDonthaveanaccount();
                                  },
                                  child: Padding(
                                      padding: getPadding(top: 27, bottom: 46),
                                      child: RichText(
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "msg_don_t_have_an_account2"
                                                        .tr,
                                                style: TextStyle(
                                                    color:
                                                        ColorConstant.black900,
                                                    fontSize: getFontSize(14),
                                                    fontFamily: 'Noto Sans',
                                                    fontWeight: FontWeight.w500,
                                                    height:
                                                        getVerticalSize(0.00))),
                                            TextSpan(
                                                text: "lbl_sign_up".tr,
                                                style: TextStyle(
                                                    color:
                                                        ColorConstant.pink80001,
                                                    fontSize: getFontSize(14),
                                                    fontFamily: 'Noto Sans',
                                                    fontWeight: FontWeight.w500,
                                                    height:
                                                        getVerticalSize(0.00)))
                                          ]),
                                          textAlign: TextAlign.left))))
                        ])))));
  }

  onTapImgArrowleft() {
    Get.toNamed(AppRoutes.signInScreen);
  }

  onTapContinue() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      APIHandler apiClient = APIHandler();

      dynamic forgotPswdObj = {
        "email": controller.emailController.text,
      };

      print(forgotPswdObj);
      dynamic response =
          await apiClient.post('/forgotPassword', data: forgotPswdObj);

      // sample response
      // {
      //     "statusCode": "200",
      //     "message": "OTP sent to your email address",
      //     "email_otp_status": "email otp sent",
      //     "uid": 1
      // }
      dynamic responseData = response.data;
      print(responseData);
      prefs.setString('email', controller.emailController.text);
      prefs.setInt('uid', responseData['uid']);
      Get.snackbar('Success', responseData['message']);
      Get.toNamed(AppRoutes.forgotPasswordVerificationScreen);
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }

  onTapBtnGoogle() async {
    var url = 'https://accounts.google.com/';
    if (!await launch(url)) {
      throw 'Could not launch https://accounts.google.com/';
    }
  }

  onTapBtnFacebook() async {
    var url = 'https://www.facebook.com/login/';
    if (!await launch(url)) {
      throw 'Could not launch https://www.facebook.com/login/';
    }
  }

  onTapTxtDonthaveanaccount() {
    Get.toNamed(AppRoutes.signUpScreen);
  }
}
