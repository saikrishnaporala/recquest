import 'package:recquest_21/utils/auth_controller.dart';

import 'controller/my_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/widgets/app_bar/appbar_image.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';
import 'package:recquest_21/widgets/custom_button.dart';

class MyProfileScreen extends GetWidget<MyProfileController> {
  @override
  Widget build(BuildContext context) {
    final MyProfileController controller =
        Get.put(MyProfileController(), permanent: false);
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
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
                    text: "lbl_my_profile".tr, margin: getMargin(left: 16)),
                actions: [
                  GestureDetector(
                    onTap: () {
                      onTapImgEdit();
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      margin: getMargin(
                        right: 5,
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Icon(
                        Icons.edit_square,
                        color: ColorConstant.pink800,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onTapUpdatePassword();
                    },
                    // alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: 44,
                      height: 44,
                      margin: getMargin(
                        right: 5,
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Icon(
                        Icons.password,
                        color: ColorConstant.pink800,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AuthController.instance.logout();
                    },
                    // alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: 44,
                      height: 44,
                      margin: getMargin(
                        right: 5,
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Icon(
                        Icons.logout,
                        color: ColorConstant.pink800,
                      ),
                    ),
                  ),
                ],
                styleType: Style.bgFillWhiteA700),
            body: Container(
                width: size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          width: size.width,
                          padding: getPadding(
                              left: 16, top: 1, right: 16, bottom: 1),
                          decoration: AppDecoration.fillGray100,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    height: getVerticalSize(109.00),
                                    width: getHorizontalSize(108.00),
                                    margin: getMargin(top: 25),
                                    child: Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          CustomImageView(
                                              imagePath: ImageConstant.userIcon,
                                              height: getSize(80.00),
                                              width: getSize(80.00),
                                              radius: BorderRadius.circular(
                                                  getHorizontalSize(54.00)),
                                              alignment: Alignment.center),
                                        ])),
                                Padding(
                                  padding: getPadding(top: 10),
                                  child: Obx(() => Text(
                                      controller.firstname.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtNotoSansBold24
                                          .copyWith(
                                              height: getVerticalSize(1.00)))),
                                ),
                                Container(
                                    width: getHorizontalSize(300.00),
                                    margin: getMargin(top: 14, bottom: 15),
                                    child: Obx(() => Text(
                                        controller.email.toString(),
                                        maxLines: null,
                                        textAlign: TextAlign.center,
                                        style: AppStyle.txtNotoSansRegular12
                                            .copyWith(
                                                height:
                                                    getVerticalSize(0.86))))),
                              ])),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 15, top: 12),
                              child: Text("lbl_about_me".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansSemiBold18
                                      .copyWith(
                                          height: getVerticalSize(1.26))))),
                      Container(
                        // height: getVerticalSize(95.00),
                        width: getHorizontalSize(335.00),
                        margin: getMargin(top: 5),
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Obx(
                              () => Text(controller.about.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansRegular12),
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: getPadding(left: 16, top: 10, right: 9),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("lbl_interest".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtNotoSansSemiBold18
                                        .copyWith(
                                            height: getVerticalSize(1.26))),
                                CustomButton(
                                    height: 28,
                                    width: 85,
                                    text: "lbl_change".tr.toUpperCase(),
                                    variant: ButtonVariant.OutlineCyan30014_2,
                                    shape: ButtonShape.RoundedBorder4,
                                    padding: ButtonPadding.PaddingT6,
                                    fontStyle:
                                        ButtonFontStyle.NotoSansBoldItalic10,
                                    prefixWidget: Container(
                                        margin: getMargin(right: 3),
                                        child: CustomImageView(
                                            svgPath: ImageConstant
                                                .imgEditWhiteA700)))
                              ])),
                      Padding(
                          padding: getPadding(top: 13, bottom: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    padding: getPadding(
                                        top: 6, bottom: 6, left: 6, right: 6),
                                    decoration: AppDecoration.txtFillTealA400
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .txtRoundedBorder6),
                                    child: Text("lbl_movie".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtNotoSansRegular12
                                            .copyWith(
                                                height:
                                                    getVerticalSize(1.00)))),
                                Container(
                                    margin: getMargin(left: 12),
                                    padding: getPadding(
                                        top: 6, bottom: 6, left: 6, right: 6),
                                    decoration: AppDecoration
                                        .txtFillIndigoA20001
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .txtRoundedBorder6),
                                    child: Text("lbl_games_online".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtNotoSansRegular12
                                            .copyWith(
                                                height:
                                                    getVerticalSize(1.00)))),
                                Container(
                                    margin: getMargin(left: 12),
                                    padding: getPadding(
                                        top: 6, bottom: 6, left: 6, right: 6),
                                    decoration: AppDecoration.txtFillRed400
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .txtRoundedBorder6),
                                    child: Text("lbl_concert".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtNotoSansRegular12
                                            .copyWith(
                                                height:
                                                    getVerticalSize(1.00)))),
                                Container(
                                    margin: getMargin(left: 12),
                                    padding: getPadding(
                                        top: 6, bottom: 6, left: 6, right: 6),
                                    decoration: AppDecoration
                                        .txtFillDeeporange300
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .txtRoundedBorder6),
                                    child: Text("lbl_music".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: AppStyle.txtNotoSansRegular12
                                            .copyWith(
                                                height: getVerticalSize(1.00))))
                              ]))
                    ]))));
  }

  onTapImgEdit() {
    Get.toNamed(AppRoutes.personalInformationScreen);
  }

  onTapImgPlus() {
    Get.toNamed(AppRoutes.createEventsScreen);
  }

  onTapUpdatePassword() {
    Get.toNamed(AppRoutes.accountInformationScreen);
  }

  onTapArrowleft() {
    Get.back();
  }
}
