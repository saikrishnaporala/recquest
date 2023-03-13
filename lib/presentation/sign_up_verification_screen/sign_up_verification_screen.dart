import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/utils/auth_controller.dart';
import 'package:recquest_21/utils/background_controller.dart';
import 'package:recquest_21/widgets/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/sign_up_verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/widgets/custom_button.dart';

// ignore: must_be_immutable
class SignUpVerificationScreen extends GetWidget<SignUpVerificationController> {
  dynamic argData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray10001,
            body: Container(
                width: size.width,
                padding: getPadding(left: 17, top: 19, right: 17, bottom: 19),
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
                          padding: getPadding(left: 3, top: 2),
                          child: Text("lbl_verification".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansBold24
                                  .copyWith(height: getVerticalSize(1.00)))),
                      Container(
                          width: getHorizontalSize(320.00),
                          margin: getMargin(left: 3, top: 35),
                          child: Text(
                              "We’ve send you the verification code on " +
                                  argData.email,
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansMedium16
                                  .copyWith(height: getVerticalSize(1.04)))),
                      CustomTextFormField(
                        width: 340,
                        focusNode: FocusNode(),
                        controller: controller.otpinputController,
                        hintText: "lbl_otp".tr,
                        margin: getMargin(left: 1, top: 26),
                        textInputAction: TextInputAction.done,
                      ),
                      CustomButton(
                          height: 48,
                          width: 340,
                          text: "lbl_continue2".tr.toUpperCase(),
                          margin: getMargin(left: 1, top: 29),
                          shape: ButtonShape.RoundedBorder14,
                          padding: ButtonPadding.PaddingAll9,
                          fontStyle: ButtonFontStyle.NotoSansBold16,
                          onTap: onTapContinue),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: getPadding(top: 10),
                          child: GestureDetector(
                            onTap: () =>
                                controller.isEnabled.value ? resendOTP() : null,
                            child: Obx(
                              () => controller.isEnabled.value
                                  ? Text(
                                      'Re-Send OTP',
                                      style: AppStyle.txtNotoSansMedium16,
                                    )
                                  : Text(
                                      "Resend Code in " +
                                          controller.time.toString(),
                                      style: AppStyle.txtNotoSansMedium16),
                            ),
                          ),
                        ),
                      ),
                      // Align(
                      //     alignment: Alignment.center,
                      //     child: Padding(
                      //         padding: getPadding(top: 40),
                      //         child: Text("lbl_or_login_with".tr,
                      //             overflow: TextOverflow.ellipsis,
                      //             textAlign: TextAlign.left,
                      //             style: AppStyle.txtNotoSansMedium16Black900
                      //                 .copyWith(
                      //                     height: getVerticalSize(1.04))))),
                      // Align(
                      //     alignment: Alignment.center,
                      //     child: Padding(
                      //         padding: getPadding(top: 23),
                      //         child: Row(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               CustomIconButton(
                      //                   height: 60,
                      //                   width: 60,
                      //                   padding: IconButtonPadding.PaddingAll12,
                      //                   onTap: () {
                      //                     onTapBtnGoogle();
                      //                   },
                      //                   child: CustomImageView(
                      //                       svgPath: ImageConstant.imgGoogle)),
                      //               CustomIconButton(
                      //                   height: 60,
                      //                   width: 60,
                      //                   margin: getMargin(left: 40),
                      //                   padding: IconButtonPadding.PaddingAll15,
                      //                   onTap: () {
                      //                     onTapBtnFacebook();
                      //                   },
                      //                   child: CustomImageView(
                      //                       svgPath: ImageConstant.imgFacebook))
                      //             ]))),
                      // Align(
                      //     alignment: Alignment.center,
                      //     child: GestureDetector(
                      //         onTap: () {
                      //           onTapTxtAlreadyhavean();
                      //         },
                      //         child: Padding(
                      //             padding: getPadding(top: 27, bottom: 5),
                      //             child: RichText(
                      //                 text: TextSpan(children: [
                      //                   TextSpan(
                      //                       text: "msg_already_have_an2".tr,
                      //                       style: TextStyle(
                      //                           color: ColorConstant.black900,
                      //                           fontSize: getFontSize(14),
                      //                           fontFamily: 'Noto Sans',
                      //                           fontWeight: FontWeight.w500,
                      //                           height: getVerticalSize(1.00))),
                      //                   TextSpan(
                      //                       text: "lbl_sign_in".tr,
                      //                       style: TextStyle(
                      //                           color: ColorConstant.pink80001,
                      //                           fontSize: getFontSize(14),
                      //                           fontFamily: 'Noto Sans',
                      //                           fontWeight: FontWeight.w500,
                      //                           height: getVerticalSize(1.00)))
                      //                 ]),
                      //                 textAlign: TextAlign.left))))
                    ]))));
  }

  onTapImgArrowleft() {
    Get.toNamed(AppRoutes.signUpScreen);
  }

  onTapContinue() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      APIHandler apiClient = APIHandler();

      dynamic signupOTPObj = {
        "email_otp": controller.otpinputController.text,
        "email": prefs.getString("email"),
        "password": prefs.getString("password")
      };

      dynamic response =
          await apiClient.post('/validateRegistrationOTP', data: signupOTPObj);

      dynamic responseData = response.data;
      print(responseData);
      prefs.setString('access_token', responseData['access_token']);
      prefs.setInt('id', responseData['user']['id']);
      prefs.setString('firstname', responseData['user']['firstname']);
      prefs.setString('email', responseData['user']['email']);
      BackgroundController.instance.uid.value = responseData['user']['id'];
      dynamic firebaseReturn = AuthController.instance.register(
          prefs.getString("email").toString(),
          prefs.getString("password").toString());
      print(firebaseReturn);

      // Get.toNamed(AppRoutes.signInScreen);
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }

  onTapBtnGoogle() async {}

  onTapBtnFacebook() async {}

  onTapTxtAlreadyhavean() {
    Get.toNamed(AppRoutes.signInScreen);
  }

  resendOTP() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      APIHandler apiClient = APIHandler();

      dynamic forgotPswdObj = {
        "email": prefs.getString("email"),
      };

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
      Get.snackbar('Success', responseData['message']);
      controller.onReady();
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }
}
