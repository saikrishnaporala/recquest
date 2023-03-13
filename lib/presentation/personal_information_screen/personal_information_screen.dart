import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/personal_information_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/core/utils/validation_functions.dart';
import 'package:recquest_21/widgets/app_bar/appbar_image.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';
import 'package:recquest_21/widgets/custom_button.dart';
import 'package:recquest_21/widgets/custom_drop_down.dart';
import 'package:recquest_21/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class PersonalInformationScreen
    extends GetWidget<PersonalInformationController> {
  GlobalKey<FormState> PersonalInfoKey = GlobalKey<FormState>();

  ///Date
  DateTime selected = DateTime.now();
  DateTime initial = DateTime(2000);
  DateTime last = DateTime(2025);

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
                    onTap: onTapArrowleft),
                title: AppbarSubtitle(
                    text: "msg_personal_information".tr,
                    margin: getMargin(left: 16)),
                styleType: Style.bgFillWhiteA700),
            body: Form(
                key: PersonalInfoKey,
                child: Container(
                    width: size.width,
                    padding:
                        getPadding(left: 10, top: 12, right: 10, bottom: 12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("msg_please_fill_the".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansMedium16),
                          Padding(
                              padding: getPadding(top: 10),
                              child: Text("lbl_first_name".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16)),
                          CustomTextFormField(
                              width: 355,
                              focusNode: FocusNode(),
                              controller: controller.firstname,
                              hintText: "lbl_first_name".tr,
                              margin: getMargin(top: 5),
                              fontStyle:
                                  TextFormFieldFontStyle.NotoSansRegular14,
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          Padding(
                              padding: getPadding(top: 10),
                              child: Text("lbl_last_name".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16)),
                          CustomTextFormField(
                              width: 355,
                              focusNode: FocusNode(),
                              controller: controller.lastname,
                              hintText: "lbl_last_name".tr,
                              margin: getMargin(top: 5),
                              fontStyle:
                                  TextFormFieldFontStyle.NotoSansRegular14,
                              validator: (value) {
                                if (!isText(value)) {
                                  return "Please enter valid text";
                                }
                                return null;
                              }),
                          Padding(
                              padding: getPadding(top: 10),
                              child: Text("lbl_email_address".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16)),
                          CustomTextFormField(
                              width: 355,
                              focusNode: FocusNode(),
                              controller: controller.email,
                              hintText: "msg_youremail_gmail_com".tr,
                              margin: getMargin(top: 5),
                              fontStyle:
                                  TextFormFieldFontStyle.NotoSansRegular14,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null ||
                                    (!isValidEmail(value, isRequired: true))) {
                                  return "Please enter valid email";
                                }
                                return null;
                              }),
                          Padding(
                              padding: getPadding(top: 10),
                              child: Text("lbl_date_of_birth".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16)),
                          GestureDetector(
                              onTap: () {
                                onTapDobinput();
                              },
                              child: Container(
                                  margin: getMargin(top: 5),
                                  padding: getPadding(
                                      left: 14, top: 13, right: 14, bottom: 13),
                                  decoration: AppDecoration.outlineBlack90007
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                            padding:
                                                getPadding(left: 2, bottom: 1),
                                            child: Obx(() => Text(
                                                controller
                                                    .personalInformationModelObj
                                                    .value
                                                    .dob
                                                    .value,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle
                                                    .txtNotoSansMedium16))),
                                        CustomImageView(
                                            svgPath: ImageConstant.imgCalendar,
                                            height: getSize(19.00),
                                            width: getSize(19.00),
                                            margin:
                                                getMargin(top: 1, bottom: 1))
                                      ]))),
                          Padding(
                              padding: getPadding(top: 10),
                              child: Text("lbl_gender".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16)),
                          Obx(
                            () => CustomDropDown(
                              width: 355,
                              focusNode: FocusNode(),
                              icon: Container(
                                  margin: getMargin(left: 30, right: 18),
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgArrowdown)),
                              hintText: "lbl_gender".tr,
                              margin: getMargin(top: 5),
                              items: controller.personalInformationModelObj
                                  .value.dropdownItemList,
                              onChanged: (value) {
                                controller.onSelected(value);
                              },
                            ),
                          ),
                          Padding(
                              padding: getPadding(top: 10),
                              child: Text("lbl_about".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16)),
                          CustomTextFormField(
                              width: 355,
                              focusNode: FocusNode(),
                              controller: controller.about,
                              hintText: "lbl_about".tr,
                              margin: getMargin(top: 5),
                              variant: TextFormFieldVariant.OutlineBlack90007_2,
                              fontStyle: TextFormFieldFontStyle
                                  .NotoSansRegular14Bluegray900b2,
                              textInputAction: TextInputAction.done,
                              maxLines: 4),
                          CustomButton(
                              height: 49,
                              width: 350,
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
      final prefs = await SharedPreferences.getInstance();
      APIHandler apiClient = APIHandler();

      dynamic personalDataObj = {
        'firstname': controller.firstname.text,
        'lastname': controller.lastname.text,
        'email': controller.email.text,
        'dob': controller.dob.text,
        'gender': controller.gender.text,
        'about': controller.about.text
      };

      dynamic response = await apiClient.post('/updateUser',
          data: personalDataObj, isAuthenticated: true);

      dynamic resondeData = response.data;
      print(resondeData['message']);
      MyProfileModel userprofile = MyProfileModel.fromJson(response.data);
      prefs.setString('firstname', resondeData['user']['firstname']);
      prefs.setString('email', resondeData['user']['email']);
      Get.snackbar('Success', resondeData['message']);
      Get.toNamed(AppRoutes.myProfileScreen, arguments: userprofile);
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }

  onTapArrowleft() {
    Get.back();
  }

  Future<void> onTapDobinput() async {
    DateTime? dateTime = await showDatePicker(
        context: Get.context!,
        initialDate:
            controller.personalInformationModelObj.value.selectedYyyymmddTxt,
        firstDate: DateTime(1970),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (dateTime != null) {
      controller.personalInformationModelObj.value.selectedYyyymmddTxt =
          dateTime;
      controller.personalInformationModelObj.value.dob.value =
          dateTime.format(YYYY_MM_DD);
    }
  }
}
