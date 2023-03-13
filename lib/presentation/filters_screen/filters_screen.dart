import 'controller/filters_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/widgets/custom_button.dart';
import 'package:recquest_21/widgets/custom_icon_button.dart';

class FiltersScreen extends GetWidget<FiltersController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          padding: getPadding(
            left: 13,
            right: 13,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "lbl_filter".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtNotoSansBold24.copyWith(
                  height: getVerticalSize(
                    0.89,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomIconButton(
                          height: 58,
                          width: 58,
                          variant: IconButtonVariant.FillPink80001,
                          padding: IconButtonPadding.PaddingAll15,
                          child: CustomImageView(
                            svgPath: ImageConstant.imgGlobeWhiteA700,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 11,
                          ),
                          child: Text(
                            "lbl_sports".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtNotoSansMedium16.copyWith(
                              height: getVerticalSize(
                                1.10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: getPadding(
                        bottom: 2,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomIconButton(
                            height: 58,
                            width: 58,
                            variant: IconButtonVariant.OutlineGray30001,
                            padding: IconButtonPadding.PaddingAll15,
                            child: CustomImageView(
                              svgPath: ImageConstant.imgMusicGray40003,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 8,
                            ),
                            child: Text(
                              "lbl_music".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansMedium16.copyWith(
                                height: getVerticalSize(
                                  1.10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        bottom: 1,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomIconButton(
                            height: 58,
                            width: 58,
                            variant: IconButtonVariant.FillPink80001,
                            padding: IconButtonPadding.PaddingAll15,
                            child: CustomImageView(
                              svgPath: ImageConstant.imgShare,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              left: 16,
                              top: 9,
                            ),
                            child: Text(
                              "lbl_art".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansMedium16.copyWith(
                                height: getVerticalSize(
                                  1.10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        bottom: 2,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomIconButton(
                            height: 58,
                            width: 58,
                            variant: IconButtonVariant.OutlineGray30001,
                            padding: IconButtonPadding.PaddingAll15,
                            child: CustomImageView(
                              svgPath: ImageConstant.imgCarGray40003,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 9,
                            ),
                            child: Text(
                              "lbl_food".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansMedium16.copyWith(
                                height: getVerticalSize(
                                  1.10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        bottom: 2,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomIconButton(
                            height: 58,
                            width: 58,
                            variant: IconButtonVariant.OutlineGray30001,
                            padding: IconButtonPadding.PaddingAll15,
                            child: CustomImageView(
                              svgPath: ImageConstant.imgCarGray40003,
                            ),
                          ),
                          Padding(
                            padding: getPadding(
                              top: 9,
                            ),
                            child: Text(
                              "lbl_food".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansMedium16.copyWith(
                                height: getVerticalSize(
                                  1.10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 19,
                    top: 16,
                  ),
                  child: Text(
                    "lbl_time_date".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtNotoSansMedium16.copyWith(
                      height: getVerticalSize(
                        1.42,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 19,
                    top: 15,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: getHorizontalSize(
                          71.00,
                        ),
                        padding: getPadding(
                          left: 11,
                          top: 5,
                          right: 11,
                          bottom: 5,
                        ),
                        decoration: AppDecoration.txtOutlineGray30002.copyWith(
                          borderRadius: BorderRadiusStyle.txtRoundedBorder10,
                        ),
                        child: Text(
                          "lbl_today".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtNotoSansMedium16.copyWith(
                            height: getVerticalSize(
                              1.19,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          96.00,
                        ),
                        margin: getMargin(
                          left: 10,
                        ),
                        padding: getPadding(
                          left: 10,
                          top: 6,
                          right: 10,
                          bottom: 6,
                        ),
                        decoration: AppDecoration.txtFillPink80001.copyWith(
                          borderRadius: BorderRadiusStyle.txtRoundedBorder10,
                        ),
                        child: Text(
                          "lbl_tomorrow".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtNotoSansMedium16.copyWith(
                            height: getVerticalSize(
                              1.19,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          94.00,
                        ),
                        margin: getMargin(
                          left: 10,
                        ),
                        padding: getPadding(
                          left: 9,
                          top: 7,
                          right: 9,
                          bottom: 7,
                        ),
                        decoration: AppDecoration.txtOutlineGray30002.copyWith(
                          borderRadius: BorderRadiusStyle.txtRoundedBorder10,
                        ),
                        child: Text(
                          "lbl_this_week".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtNotoSansMedium16.copyWith(
                            height: getVerticalSize(
                              1.19,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: getMargin(
                  left: 19,
                  top: 14,
                  right: 18,
                ),
                padding: getPadding(
                  left: 12,
                  top: 7,
                  right: 12,
                  bottom: 7,
                ),
                decoration: AppDecoration.outlineGray30002.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder3,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomImageView(
                      svgPath: ImageConstant.imgCalendarPink80001,
                      height: getVerticalSize(
                        20.00,
                      ),
                      width: getHorizontalSize(
                        18.00,
                      ),
                      margin: getMargin(
                        bottom: 1,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 1,
                        bottom: 1,
                      ),
                      child: Text(
                        "msg_choose_from_calender".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtNotoSansMedium16.copyWith(
                          height: getVerticalSize(
                            1.19,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    CustomImageView(
                      svgPath: ImageConstant.imgArrowrightPink80001,
                      height: getVerticalSize(
                        7.00,
                      ),
                      width: getHorizontalSize(
                        3.00,
                      ),
                      margin: getMargin(
                        top: 7,
                        right: 3,
                        bottom: 6,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      height: 46,
                      width: 138,
                      text: "lbl_reset".tr.toUpperCase(),
                      variant: ButtonVariant.OutlineGray30001,
                      shape: ButtonShape.RoundedBorder10,
                      padding: ButtonPadding.PaddingAll9,
                      fontStyle: ButtonFontStyle.NotoSansBold16Gray90001,
                    ),
                    Container(
                      height: getVerticalSize(
                        46.00,
                      ),
                      width: getHorizontalSize(
                        138.00,
                      ),
                      margin: getMargin(
                        left: 13,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomImageView(
                            svgPath: ImageConstant.imgRectanglePink80001,
                            height: getVerticalSize(
                              46.00,
                            ),
                            width: getHorizontalSize(
                              138.00,
                            ),
                            radius: BorderRadius.circular(
                              getHorizontalSize(
                                10.00,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "lbl_apply".tr.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansMedium16.copyWith(
                                letterSpacing: getHorizontalSize(
                                  1.00,
                                ),
                                height: getVerticalSize(
                                  1.00,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
