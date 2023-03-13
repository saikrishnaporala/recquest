import 'controller/onboarding_two_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingTwoScreen extends GetWidget<OnboardingTwoController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray10001,
            body: Container(
                width: size.width,
                padding: getPadding(top: 30, left: 37, right: 37, bottom: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                              onTap: () {
                                onTapTxtSkip();
                              },
                              child: Padding(
                                  padding: getPadding(top: 2, right: 1),
                                  child: Text("lbl_skip".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtNotoSansSemiBold18)))),
                      CustomImageView(
                          svgPath: ImageConstant.imgGroupCyan100,
                          height: getVerticalSize(274.00),
                          width: getHorizontalSize(300.00),
                          margin: getMargin(top: 17)),
                      Padding(
                          padding: getPadding(top: 31),
                          child: Text("msg_invite_all_your".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansSemiBold18)),
                      Container(
                          width: getHorizontalSize(269.00),
                          margin: getMargin(top: 38),
                          child: Text("msg_make_your_event".tr,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtNotoSansMedium16)),
                      Spacer(),
                      Padding(
                          padding: getPadding(left: 3, right: 1),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtBack();
                                    },
                                    child: Text("lbl_back".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtNotoSansSemiBold18)),
                                Spacer(flex: 47),
                                Container(
                                    height: getVerticalSize(12.00),
                                    margin: getMargin(top: 8, bottom: 7),
                                    child: SmoothIndicator(
                                        offset: 0,
                                        count: 3,
                                        axisDirection: Axis.horizontal,
                                        effect: ScrollingDotsEffect(
                                            spacing: 12,
                                            activeDotColor:
                                                ColorConstant.pink80001,
                                            dotColor: ColorConstant.pink8006c,
                                            dotHeight: getVerticalSize(12.00),
                                            dotWidth:
                                                getHorizontalSize(12.00)))),
                                Spacer(flex: 52),
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtNext();
                                    },
                                    child: Padding(
                                        padding: getPadding(top: 3, bottom: 3),
                                        child: Text("lbl_next".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle
                                                .txtNotoSansSemiBold18)))
                              ])),
                      GestureDetector(
                          onTap: () {
                            onTapTxtAlreadyhavean();
                          },
                          child: Padding(
                              padding: getPadding(top: 43),
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
                                  textAlign: TextAlign.left)))
                    ]))));
  }

  onTapTxtSkip() {
    Get.toNamed(AppRoutes.signInScreen);
  }

  onTapTxtBack() {
    Get.toNamed(AppRoutes.onboardingOneScreen);
  }

  onTapTxtNext() {
    Get.toNamed(AppRoutes.onboardingThreeScreen);
  }

  onTapTxtAlreadyhavean() {
    Get.toNamed(AppRoutes.signInScreen);
  }
}
