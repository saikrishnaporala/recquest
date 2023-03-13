import 'package:recquest_21/api/api_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/core/utils/validation_functions.dart';
import 'package:recquest_21/widgets/custom_button.dart';
import 'package:recquest_21/widgets/custom_icon_button.dart';
import 'package:recquest_21/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ResetPasswordScreen extends GetWidget<ResetPasswordController> {
  GlobalKey<FormState> resetPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.gray10001,
            body: Form(
                key: resetPasswordKey,
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
                              padding: getPadding(left: 3, top: 5),
                              child: Text("msg_pick_a_new_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansBold24)),
                          Padding(
                              padding: getPadding(left: 3, top: 33),
                              child: Text("msg_help_secure_your".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16)),
                          Obx(() => CustomTextFormField(
                              width: 340,
                              focusNode: FocusNode(),
                              controller: controller.newPassword,
                              hintText: "lbl_new_password".tr,
                              margin: getMargin(left: 1, top: 22),
                              padding: TextFormFieldPadding.PaddingT12,
                              fontStyle:
                                  TextFormFieldFontStyle.AsapRomanRegular14,
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
                          Obx(() => CustomTextFormField(
                              width: 340,
                              focusNode: FocusNode(),
                              controller: controller.confirmNewPassword,
                              hintText: "msg_confirm_new_password".tr,
                              margin: getMargin(left: 1, top: 9),
                              padding: TextFormFieldPadding.PaddingT12,
                              fontStyle:
                                  TextFormFieldFontStyle.AsapRomanRegular14,
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              suffix: InkWell(
                                  onTap: () {
                                    controller.isShowPassword1.value =
                                        !controller.isShowPassword1.value;
                                  },
                                  child: Container(
                                      margin: getMargin(
                                          left: 30,
                                          top: 13,
                                          right: 21,
                                          bottom: 13),
                                      child: CustomImageView(
                                          svgPath:
                                              controller.isShowPassword1.value
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
                              isObscureText:
                                  !controller.isShowPassword1.value)),
                          CustomButton(
                              height: 48,
                              width: 340,
                              text: "lbl_done".tr.toUpperCase(),
                              margin: getMargin(left: 1, top: 8),
                              shape: ButtonShape.RoundedBorder14,
                              padding: ButtonPadding.PaddingAll9,
                              fontStyle: ButtonFontStyle.NotoSansBold16),
                          Spacer(),
                          Align(
                              alignment: Alignment.center,
                              child: Text("lbl_or_login_with".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16)),
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

  onTapUpdatePassword() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      APIHandler apiClient = APIHandler();

      dynamic resetPswdObj = {
        "password": controller.newPassword.text,
        "confirmNewPassword": controller.confirmNewPassword.text,
        "id": prefs.getString("id")
      };

      dynamic response =
          await apiClient.post('/updatePassword', data: resetPswdObj);

      // sample response
      // {
      //     "statusCode": "200",
      //     "message": "OTP sent to your email address",
      //     "email_otp_status": "email otp sent"
      // }
      dynamic responseData = response.data;

      Get.snackbar('Success', responseData['message']);
      Get.toNamed(AppRoutes.signInScreen);
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }

  onTapImgArrowleft() {
    Get.toNamed(AppRoutes.forgotPasswordScreen);
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
