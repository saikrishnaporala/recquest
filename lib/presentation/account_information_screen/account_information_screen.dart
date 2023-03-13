import 'package:recquest_21/api/api_handler.dart';

import 'controller/account_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/widgets/app_bar/appbar_image.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';
import 'package:recquest_21/widgets/custom_button.dart';
import 'package:recquest_21/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class AccountInformationScreen extends GetWidget<AccountInformationController> {
  GlobalKey<FormState> pswdUpdateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorConstant.gray10001,
            appBar: CustomAppBar(
                height: getVerticalSize(50.00),
                leadingWidth: 32,
                leading: AppbarImage(
                    height: getSize(16.00),
                    width: getSize(16.00),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 15, bottom: 15),
                    onTap: onTapArrowleft5),
                title: AppbarSubtitle(
                    text: "lbl_update_password".tr,
                    margin: getMargin(left: 16)),
                styleType: Style.bgFillWhiteA700),
            body: Form(
                key: pswdUpdateKey,
                child: Container(
                    width: size.width,
                    padding: getPadding(left: 10, top: 9, right: 10, bottom: 9),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("lbl_password".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansMedium16
                                  .copyWith(height: getVerticalSize(1.00))),
                          CustomTextFormField(
                            width: 355,
                            focusNode: FocusNode(),
                            controller: controller.password,
                            hintText: "lbl_new_password".tr,
                            margin: getMargin(top: 10),
                            textInputType: TextInputType.emailAddress,
                            // validator: (value) {
                            //   if (value == null ||
                            //       (!isValidEmail(value, isRequired: true))) {
                            //     return "Please enter valid password";
                            //   }
                            //   return null;
                            // },
                          ),
                          Padding(
                              padding: getPadding(top: 9),
                              child: Text("msg_confirm_password".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16.copyWith(
                                      height: getVerticalSize(1.00)))),
                          CustomTextFormField(
                            width: 355,
                            focusNode: FocusNode(),
                            controller: controller.password_confirmation,
                            hintText: "msg_confirm_password".tr,
                            margin: getMargin(top: 10),
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.emailAddress,
                            // validator: (value) {
                            //   if (value == null ||
                            //       (!isValidEmail(value, isRequired: true))) {
                            //     return "Please enter valid password";
                            //   }
                            //   return null;
                            // },
                          ),
                          CustomButton(
                              height: 49,
                              width: 355,
                              text: "lbl_done2".tr,
                              margin: getMargin(top: 10, bottom: 5),
                              shape: ButtonShape.RoundedBorder10,
                              padding: ButtonPadding.PaddingAll9,
                              fontStyle: ButtonFontStyle.NotoSansSemiBold18,
                              onTap: onTapDone)
                        ])))));
  }

  onTapDone() async {
    try {
      // final prefs = await SharedPreferences.getInstance();
      APIHandler apiClient = APIHandler();

      dynamic passwordDataObj = {'password': controller.password.text};

      dynamic response = await apiClient.post('/updateUser',
          data: passwordDataObj, isAuthenticated: true);

      dynamic resondeData = response.data;
      Get.snackbar('Success', resondeData['message']);
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }

  onTapArrowleft5() {
    Get.back();
  }
}
