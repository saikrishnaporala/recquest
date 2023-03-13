import 'controller/onboarding_three_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:recquest_21/core/app_export.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingThreeScreen extends GetWidget<OnboardingThreeController> {
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
                                  padding: getPadding(top: 2),
                                  child: Text("lbl_skip".tr,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtNotoSansSemiBold18)))),
                      Container(
                          height: getVerticalSize(273.00),
                          width: getHorizontalSize(271.00),
                          margin: getMargin(top: 25),
                          child: Stack(alignment: Alignment.center, children: [
                            CustomImageView(
                                svgPath: ImageConstant.imgBackground,
                                height: getVerticalSize(266.00),
                                width: getHorizontalSize(256.00),
                                alignment: Alignment.centerLeft,
                                margin: getMargin(left: 2)),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    height: getVerticalSize(268.00),
                                    width: getHorizontalSize(271.00),
                                    child: Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgGroupGray600,
                                              height: getSize(137.00),
                                              width: getSize(137.00),
                                              alignment: Alignment.topLeft,
                                              margin:
                                                  getMargin(left: 57, top: 60)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgGroupGray600144x144,
                                              height: getSize(144.00),
                                              width: getSize(144.00),
                                              alignment: Alignment.topLeft,
                                              margin:
                                                  getMargin(left: 45, top: 19)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgGroupGray600146x147,
                                              height: getVerticalSize(146.00),
                                              width: getHorizontalSize(147.00),
                                              alignment: Alignment.topCenter,
                                              margin: getMargin(top: 22)),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                  height: getSize(131.00),
                                                  width: getSize(131.00),
                                                  margin: getMargin(
                                                      left: 63, top: 36),
                                                  padding: getPadding(
                                                      left: 7,
                                                      top: 6,
                                                      right: 7,
                                                      bottom: 6),
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: fs.Svg(
                                                              ImageConstant
                                                                  .imgGroup4906),
                                                          fit: BoxFit.cover)),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child: Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        95.00),
                                                                width:
                                                                    getHorizontalSize(
                                                                        112.00),
                                                                margin:
                                                                    getMargin(
                                                                        top: 1),
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: ColorConstant
                                                                            .whiteA700))),
                                                        Align(
                                                            alignment: Alignment
                                                                .bottomRight,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        right:
                                                                            2),
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVectorOrangeA200,
                                                                          height: getVerticalSize(
                                                                              8.00),
                                                                          width:
                                                                              getHorizontalSize(7.00)),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVectorGray600,
                                                                          height: getVerticalSize(
                                                                              9.00),
                                                                          width: getHorizontalSize(
                                                                              5.00),
                                                                          margin:
                                                                              getMargin(left: 72))
                                                                    ]))),
                                                        Align(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.00),
                                                                width:
                                                                    getHorizontalSize(
                                                                        112.00),
                                                                margin:
                                                                    getMargin(
                                                                        bottom:
                                                                            18),
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: ColorConstant
                                                                            .gray400))),
                                                        Align(
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            child: Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.00),
                                                                width:
                                                                    getHorizontalSize(
                                                                        49.00),
                                                                margin:
                                                                    getMargin(
                                                                        left: 2,
                                                                        bottom:
                                                                            15),
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: ColorConstant
                                                                            .gray400))),
                                                        Align(
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            child: Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        1.00),
                                                                width:
                                                                    getHorizontalSize(
                                                                        70.00),
                                                                margin:
                                                                    getMargin(
                                                                        left: 2,
                                                                        bottom:
                                                                            12),
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: ColorConstant
                                                                            .gray400))),
                                                        CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgFavorite,
                                                            height:
                                                                getVerticalSize(
                                                                    7.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    10.00),
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            margin: getMargin(
                                                                left: 2,
                                                                bottom: 1)),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgVectorRedA200,
                                                            height:
                                                                getVerticalSize(
                                                                    7.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    10.00),
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            margin: getMargin(
                                                                left: 2,
                                                                bottom: 5)),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgVectorRedA200,
                                                            height:
                                                                getVerticalSize(
                                                                    7.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    10.00),
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            margin: getMargin(
                                                                left: 2,
                                                                bottom: 9)),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgVectorRedA2007x10,
                                                            height:
                                                                getVerticalSize(
                                                                    7.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    10.00),
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            margin: getMargin(
                                                                left: 2,
                                                                bottom: 13)),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgVectorRedA2007x10,
                                                            height:
                                                                getVerticalSize(
                                                                    7.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    10.00),
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            margin: getMargin(
                                                                left: 2,
                                                                bottom: 17)),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgVectorDeepOrange200,
                                                            height:
                                                                getVerticalSize(
                                                                    8.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    12.00),
                                                            alignment: Alignment
                                                                .bottomRight,
                                                            margin: getMargin(
                                                                bottom: 19))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Container(
                                                  width:
                                                      getHorizontalSize(8.00),
                                                  margin: getMargin(
                                                      left: 85, bottom: 98),
                                                  child: Text("lbl_1425".tr,
                                                      maxLines: null,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtNotoSansSemiBold18))),
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Container(
                                                  width:
                                                      getHorizontalSize(9.00),
                                                  margin: getMargin(
                                                      left: 110, bottom: 98),
                                                  child: Text("lbl_456".tr,
                                                      maxLines: null,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtNotoSansSemiBold18))),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgGroupIndigo300,
                                              height: getVerticalSize(122.00),
                                              width: getHorizontalSize(109.00),
                                              alignment: Alignment.topLeft,
                                              margin:
                                                  getMargin(left: 52, top: 46)),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(16.00),
                                                  width:
                                                      getHorizontalSize(4.00),
                                                  margin: getMargin(
                                                      top: 49, right: 20),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        16.00),
                                                                width:
                                                                    getHorizontalSize(
                                                                        4.00),
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: ColorConstant
                                                                            .gray800))),
                                                        Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        16.00),
                                                                width:
                                                                    getHorizontalSize(
                                                                        1.00),
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: ColorConstant
                                                                            .gray900))),
                                                        Align(
                                                            alignment: Alignment
                                                                .topLeft,
                                                            child: Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        13.00),
                                                                width:
                                                                    getHorizontalSize(
                                                                        2.00),
                                                                decoration:
                                                                    BoxDecoration(
                                                                        color: ColorConstant
                                                                            .blue100)))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(43.00),
                                                  width:
                                                      getHorizontalSize(30.00),
                                                  margin: getMargin(
                                                      top: 93, right: 65),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.topRight,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgReplyIndigo300,
                                                            height:
                                                                getVerticalSize(
                                                                    43.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    30.00),
                                                            alignment: Alignment
                                                                .center),
                                                        CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgUser,
                                                            height:
                                                                getVerticalSize(
                                                                    18.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    21.00),
                                                            alignment: Alignment
                                                                .topRight)
                                                      ]))),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgFireDeepOrange200,
                                              height: getSize(11.00),
                                              width: getSize(11.00),
                                              alignment: Alignment.topRight,
                                              margin: getMargin(
                                                  top: 58, right: 12)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorGray900012x21,
                                              height: getVerticalSize(2.00),
                                              width: getHorizontalSize(21.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(right: 69)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorGray900012x21,
                                              height: getVerticalSize(2.00),
                                              width: getHorizontalSize(22.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(right: 41)),
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgComputer,
                                              height: getVerticalSize(15.00),
                                              width: getHorizontalSize(13.00),
                                              alignment: Alignment.topRight,
                                              margin: getMargin(
                                                  top: 82, right: 60)),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(32.00),
                                                  width:
                                                      getHorizontalSize(25.00),
                                                  margin: getMargin(
                                                      top: 61, right: 51),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.topRight,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgVectorDeepOrange20032x25,
                                                            height:
                                                                getVerticalSize(
                                                                    32.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    25.00),
                                                            alignment: Alignment
                                                                .center),
                                                        Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: Container(
                                                                width:
                                                                    getHorizontalSize(
                                                                        4.00),
                                                                margin:
                                                                    getMargin(
                                                                        top:
                                                                            12),
                                                                child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVectorRedA2001x2,
                                                                          height: getVerticalSize(
                                                                              1.00),
                                                                          width:
                                                                              getHorizontalSize(2.00)),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVectorGray900011x1,
                                                                          height: getSize(
                                                                              1.00),
                                                                          width: getSize(
                                                                              1.00),
                                                                          margin:
                                                                              getMargin(left: 1)),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVectorDeepOrange2001x1,
                                                                          height: getSize(
                                                                              1.00),
                                                                          width: getSize(
                                                                              1.00),
                                                                          alignment:
                                                                              Alignment.centerRight)
                                                                    ])))
                                                      ]))),
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgSettings,
                                              height: getVerticalSize(34.00),
                                              width: getHorizontalSize(31.00),
                                              alignment: Alignment.topRight,
                                              margin: getMargin(
                                                  top: 55, right: 52)),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(118.00),
                                                  width:
                                                      getHorizontalSize(47.00),
                                                  margin: getMargin(
                                                      right: 43, bottom: 2),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgVectorBlueGray80001,
                                                            height:
                                                                getVerticalSize(
                                                                    118.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    47.00),
                                                            alignment: Alignment
                                                                .center),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgVectorGray90001,
                                                            height:
                                                                getVerticalSize(
                                                                    6.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    21.00),
                                                            alignment: Alignment
                                                                .topCenter,
                                                            margin: getMargin(
                                                                top: 10))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                  width:
                                                      getHorizontalSize(37.00),
                                                  margin: getMargin(
                                                      top: 92, right: 43),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgCrop,
                                                            height:
                                                                getVerticalSize(
                                                                    62.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    37.00)),
                                                        Padding(
                                                            padding: getPadding(
                                                                right: 11),
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgVectorBlueGray700,
                                                                      height: getVerticalSize(
                                                                          2.00),
                                                                      width: getHorizontalSize(
                                                                          1.00)),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgVectorBlueGray7002x1,
                                                                      height: getVerticalSize(
                                                                          2.00),
                                                                      width: getHorizontalSize(
                                                                          1.00),
                                                                      margin: getMargin(
                                                                          left:
                                                                              1)),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgVectorBlueGray7001x1,
                                                                      height: getSize(
                                                                          1.00),
                                                                      width: getSize(
                                                                          1.00),
                                                                      margin: getMargin(
                                                                          left:
                                                                              1)),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgVectorBlueGray700,
                                                                      height: getVerticalSize(
                                                                          2.00),
                                                                      width: getHorizontalSize(
                                                                          1.00)),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgVectorBlueGray7002x1,
                                                                      height: getVerticalSize(
                                                                          2.00),
                                                                      width: getHorizontalSize(
                                                                          1.00)),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgVector2x1,
                                                                      height: getVerticalSize(
                                                                          2.00),
                                                                      width: getHorizontalSize(
                                                                          1.00),
                                                                      margin: getMargin(
                                                                          left:
                                                                              1)),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgVector2,
                                                                      height: getVerticalSize(
                                                                          2.00),
                                                                      width: getHorizontalSize(
                                                                          1.00),
                                                                      margin: getMargin(
                                                                          left:
                                                                              1)),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgVectorBlueGray700,
                                                                      height: getVerticalSize(
                                                                          2.00),
                                                                      width: getHorizontalSize(
                                                                          1.00),
                                                                      margin: getMargin(
                                                                          left:
                                                                              1)),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgVector2x1,
                                                                      height: getVerticalSize(
                                                                          2.00),
                                                                      width: getHorizontalSize(
                                                                          1.00),
                                                                      margin: getMargin(
                                                                          left:
                                                                              1))
                                                                ]))
                                                      ]))),
                                          CustomImageView(
                                              svgPath: ImageConstant.imgCall,
                                              height: getVerticalSize(41.00),
                                              width: getHorizontalSize(50.00),
                                              alignment: Alignment.topRight,
                                              margin: getMargin(
                                                  top: 66, right: 12)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorBlueGray7004x37,
                                              height: getVerticalSize(4.00),
                                              width: getHorizontalSize(37.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(
                                                  right: 44, bottom: 117)),
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgVector2x1,
                                              height: getVerticalSize(3.00),
                                              width: getHorizontalSize(1.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(
                                                  right: 79, bottom: 116)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorBlueGray700,
                                              height: getVerticalSize(2.00),
                                              width: getHorizontalSize(1.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(
                                                  right: 78, bottom: 116)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorBlueGray700,
                                              height: getVerticalSize(3.00),
                                              width: getHorizontalSize(1.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(
                                                  right: 76, bottom: 116)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorBlueGray7002x1,
                                              height: getVerticalSize(2.00),
                                              width: getHorizontalSize(1.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(
                                                  right: 74, bottom: 115)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorBlueGray7002x1,
                                              height: getVerticalSize(2.00),
                                              width: getHorizontalSize(1.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(
                                                  right: 72, bottom: 115)),
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgVector2x1,
                                              height: getVerticalSize(2.00),
                                              width: getHorizontalSize(1.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(
                                                  right: 71, bottom: 115)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorBlueGray700,
                                              height: getVerticalSize(2.00),
                                              width: getHorizontalSize(1.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(
                                                  right: 69, bottom: 115)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorBlueGray700,
                                              height: getVerticalSize(2.00),
                                              width: getHorizontalSize(1.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(
                                                  right: 53, bottom: 114)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorBlueGray700,
                                              height: getVerticalSize(2.00),
                                              width: getHorizontalSize(1.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(
                                                  right: 51, bottom: 115)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorBlueGray700,
                                              height: getVerticalSize(2.00),
                                              width: getHorizontalSize(1.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(
                                                  right: 50, bottom: 115)),
                                          CustomImageView(
                                              svgPath: ImageConstant.imgVector3,
                                              height: getVerticalSize(2.00),
                                              width: getHorizontalSize(1.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(
                                                  right: 48, bottom: 115)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorBlueGray7002x1,
                                              height: getVerticalSize(2.00),
                                              width: getHorizontalSize(1.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(
                                                  right: 47, bottom: 116)),
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgVector2x1,
                                              height: getVerticalSize(2.00),
                                              width: getHorizontalSize(1.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(
                                                  right: 45, bottom: 116)),
                                          CustomImageView(
                                              svgPath: ImageConstant.imgVector4,
                                              height: getVerticalSize(2.00),
                                              width: getHorizontalSize(1.00),
                                              alignment: Alignment.bottomRight,
                                              margin: getMargin(
                                                  right: 44, bottom: 117)),
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgEyeIndigo500,
                                              height: getVerticalSize(16.00),
                                              width: getHorizontalSize(24.00),
                                              alignment: Alignment.topRight,
                                              margin: getMargin(
                                                  top: 90, right: 57)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorDeepOrange2004x4,
                                              height: getSize(4.00),
                                              width: getSize(4.00),
                                              alignment: Alignment.topRight,
                                              margin: getMargin(
                                                  top: 61, right: 21)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorGray80001,
                                              height: getVerticalSize(4.00),
                                              width: getHorizontalSize(23.00),
                                              alignment: Alignment.bottomLeft,
                                              margin: getMargin(left: 21)),
                                          CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgAirplane,
                                              height: getVerticalSize(11.00),
                                              width: getHorizontalSize(24.00),
                                              alignment: Alignment.bottomLeft,
                                              margin: getMargin(
                                                  left: 1, bottom: 7)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorBlueGray80001105x64,
                                              height: getVerticalSize(105.00),
                                              width: getHorizontalSize(64.00),
                                              alignment: Alignment.bottomLeft,
                                              margin: getMargin(
                                                  left: 1, bottom: 2)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgCheckmarkDeepOrange300,
                                              height: getVerticalSize(32.00),
                                              width: getHorizontalSize(31.00),
                                              alignment: Alignment.topLeft,
                                              margin: getMargin(
                                                  left: 16, top: 106)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgLightbulbLime900,
                                              height: getVerticalSize(13.00),
                                              width: getHorizontalSize(9.00),
                                              alignment: Alignment.topLeft,
                                              margin: getMargin(
                                                  left: 13, top: 119)),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(64.00),
                                                  width:
                                                      getHorizontalSize(40.00),
                                                  margin: getMargin(left: 29),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgLightbulbDeepOrange300,
                                                            height:
                                                                getVerticalSize(
                                                                    64.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    40.00),
                                                            alignment: Alignment
                                                                .center),
                                                        Align(
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left: 6,
                                                                        bottom:
                                                                            1),
                                                                child: Row(
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVectorDeepOrange100,
                                                                          height: getSize(
                                                                              4.00),
                                                                          width: getSize(
                                                                              4.00),
                                                                          margin:
                                                                              getMargin(bottom: 4)),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVectorDeepOrange100,
                                                                          height: getSize(
                                                                              4.00),
                                                                          width: getSize(
                                                                              4.00),
                                                                          margin: getMargin(
                                                                              left: 8,
                                                                              top: 4)),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVectorDeepOrange100,
                                                                          height: getSize(
                                                                              4.00),
                                                                          width: getSize(
                                                                              4.00),
                                                                          margin: getMargin(
                                                                              left: 3,
                                                                              bottom: 3))
                                                                    ])))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(16.00),
                                                  width:
                                                      getHorizontalSize(13.00),
                                                  margin: getMargin(
                                                      left: 48, top: 94),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgTrashLime900,
                                                            height:
                                                                getVerticalSize(
                                                                    16.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    13.00),
                                                            alignment: Alignment
                                                                .center),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgVectorLime900,
                                                            height:
                                                                getVerticalSize(
                                                                    5.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    10.00),
                                                            alignment: Alignment
                                                                .centerLeft)
                                                      ]))),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(30.00),
                                                  width:
                                                      getHorizontalSize(22.00),
                                                  margin: getMargin(
                                                      left: 40, top: 74),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgVolume,
                                                            height:
                                                                getVerticalSize(
                                                                    30.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    22.00),
                                                            alignment: Alignment
                                                                .center),
                                                        Align(
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            child: Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        6.00),
                                                                width:
                                                                    getHorizontalSize(
                                                                        10.00),
                                                                margin:
                                                                    getMargin(
                                                                        left: 3,
                                                                        bottom:
                                                                            7),
                                                                child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomRight,
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVectorGray900014x6,
                                                                          height: getVerticalSize(
                                                                              4.00),
                                                                          width: getHorizontalSize(
                                                                              6.00),
                                                                          alignment:
                                                                              Alignment.topLeft),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVectorGray900013x10,
                                                                          height: getVerticalSize(
                                                                              3.00),
                                                                          width: getHorizontalSize(
                                                                              10.00),
                                                                          alignment:
                                                                              Alignment.bottomRight)
                                                                    ])))
                                                      ]))),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorGray9000111x11,
                                              height: getSize(11.00),
                                              width: getSize(11.00),
                                              alignment: Alignment.topLeft,
                                              margin:
                                                  getMargin(left: 40, top: 79)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorGray9000110x9,
                                              height: getVerticalSize(10.00),
                                              width: getHorizontalSize(9.00),
                                              alignment: Alignment.topLeft,
                                              margin:
                                                  getMargin(left: 58, top: 88)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorGray9000118x28,
                                              height: getVerticalSize(18.00),
                                              width: getHorizontalSize(28.00),
                                              alignment: Alignment.topLeft,
                                              margin:
                                                  getMargin(left: 44, top: 65)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgCheckmarkLime900,
                                              height: getVerticalSize(14.00),
                                              width: getHorizontalSize(12.00),
                                              alignment: Alignment.centerLeft,
                                              margin: getMargin(left: 21)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorLime9005x6,
                                              height: getVerticalSize(5.00),
                                              width: getHorizontalSize(6.00),
                                              alignment: Alignment.topLeft,
                                              margin: getMargin(
                                                  left: 23, top: 125)),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(44.00),
                                                  width:
                                                      getHorizontalSize(42.00),
                                                  margin: getMargin(left: 26),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.center,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgCheckmarkDeepOrange30044x42,
                                                            height:
                                                                getVerticalSize(
                                                                    44.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    42.00),
                                                            alignment: Alignment
                                                                .center),
                                                        Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        42.00),
                                                                width:
                                                                    getHorizontalSize(
                                                                        41.00),
                                                                child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomCenter,
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgCheckmarkLime800,
                                                                          height: getVerticalSize(
                                                                              26.00),
                                                                          width: getHorizontalSize(
                                                                              22.00),
                                                                          alignment: Alignment
                                                                              .topLeft,
                                                                          margin: getMargin(
                                                                              left: 6,
                                                                              top: 2)),
                                                                      Align(
                                                                          alignment:
                                                                              Alignment.bottomCenter,
                                                                          child: Container(
                                                                              height: getVerticalSize(34.00),
                                                                              width: getHorizontalSize(41.00),
                                                                              child: Stack(alignment: Alignment.center, children: [
                                                                                CustomImageView(svgPath: ImageConstant.imgCloseLime800, height: getVerticalSize(34.00), width: getHorizontalSize(41.00), alignment: Alignment.center),
                                                                                Align(
                                                                                    alignment: Alignment.center,
                                                                                    child: Padding(
                                                                                        padding: getPadding(left: 6, right: 7),
                                                                                        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                                          Align(
                                                                                              alignment: Alignment.centerRight,
                                                                                              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                                                                                CustomImageView(svgPath: ImageConstant.imgVectorDeepOrange100, height: getSize(4.00), width: getSize(4.00), margin: getMargin(bottom: 1)),
                                                                                                CustomImageView(svgPath: ImageConstant.imgVectorDeepOrange100, height: getSize(4.00), width: getSize(4.00), margin: getMargin(left: 8, top: 1))
                                                                                              ])),
                                                                                          CustomImageView(svgPath: ImageConstant.imgVectorDeepOrange100, height: getSize(4.00), width: getSize(4.00), margin: getMargin(left: 5, top: 1)),
                                                                                          Padding(
                                                                                              padding: getPadding(top: 4),
                                                                                              child: Row(children: [
                                                                                                CustomImageView(svgPath: ImageConstant.imgVectorDeepOrange100, height: getSize(4.00), width: getSize(4.00), margin: getMargin(bottom: 3)),
                                                                                                CustomImageView(svgPath: ImageConstant.imgVectorDeepOrange100, height: getSize(4.00), width: getSize(4.00), margin: getMargin(left: 3, top: 3)),
                                                                                                CustomImageView(svgPath: ImageConstant.imgVectorDeepOrange100, height: getSize(4.00), width: getSize(4.00), margin: getMargin(left: 10, top: 1, bottom: 1))
                                                                                              ])),
                                                                                          CustomImageView(svgPath: ImageConstant.imgVectorDeepOrange100, height: getSize(4.00), width: getSize(4.00), alignment: Alignment.centerRight, margin: getMargin(top: 2, right: 5))
                                                                                        ])))
                                                                              ]))),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVectorDeepOrange100,
                                                                          height: getSize(
                                                                              4.00),
                                                                          width: getSize(
                                                                              4.00),
                                                                          alignment: Alignment
                                                                              .topLeft,
                                                                          margin: getMargin(
                                                                              left: 10,
                                                                              top: 6)),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVectorDeepOrange100,
                                                                          height: getSize(
                                                                              4.00),
                                                                          width: getSize(
                                                                              4.00),
                                                                          alignment: Alignment
                                                                              .topRight,
                                                                          margin:
                                                                              getMargin(right: 3)),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVectorDeepOrange100,
                                                                          height: getSize(
                                                                              4.00),
                                                                          width: getSize(
                                                                              4.00),
                                                                          alignment: Alignment
                                                                              .topRight,
                                                                          margin: getMargin(
                                                                              top: 1,
                                                                              right: 14))
                                                                    ])))
                                                      ]))),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVolumeRedA200,
                                              height: getVerticalSize(15.00),
                                              width: getHorizontalSize(24.00),
                                              alignment: Alignment.topLeft,
                                              margin:
                                                  getMargin(left: 40, top: 74)),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(16.00),
                                                  width:
                                                      getHorizontalSize(12.00),
                                                  margin: getMargin(
                                                      left: 9, top: 113),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgVectorGray800,
                                                            height:
                                                                getVerticalSize(
                                                                    16.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    12.00),
                                                            alignment: Alignment
                                                                .center),
                                                        Align(
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            child: Container(
                                                                height:
                                                                    getVerticalSize(
                                                                        15.00),
                                                                width:
                                                                    getHorizontalSize(
                                                                        10.00),
                                                                child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgMinimizeGray900,
                                                                          height: getVerticalSize(
                                                                              14.00),
                                                                          width: getHorizontalSize(
                                                                              9.00),
                                                                          alignment:
                                                                              Alignment.bottomLeft),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgInfo,
                                                                          height: getVerticalSize(
                                                                              13.00),
                                                                          width: getHorizontalSize(
                                                                              9.00),
                                                                          alignment:
                                                                              Alignment.topRight),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVectorLime9006x4,
                                                                          height: getVerticalSize(
                                                                              6.00),
                                                                          width: getHorizontalSize(
                                                                              4.00),
                                                                          alignment: Alignment
                                                                              .bottomRight,
                                                                          margin:
                                                                              getMargin(right: 1))
                                                                    ])))
                                                      ]))),
                                          CustomImageView(
                                              svgPath: ImageConstant.imgVector5,
                                              height: getSize(1.00),
                                              width: getSize(1.00),
                                              alignment: Alignment.topLeft,
                                              margin:
                                                  getMargin(left: 43, top: 89)),
                                          CustomImageView(
                                              svgPath: ImageConstant.imgVector5,
                                              height: getSize(1.00),
                                              width: getSize(1.00),
                                              alignment: Alignment.topLeft,
                                              margin:
                                                  getMargin(left: 51, top: 89)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorDeepOrange100,
                                              height: getSize(4.00),
                                              width: getSize(4.00),
                                              alignment: Alignment.topLeft,
                                              margin: getMargin(
                                                  left: 41, top: 109)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorDeepOrange100,
                                              height: getSize(4.00),
                                              width: getSize(4.00),
                                              alignment: Alignment.bottomLeft,
                                              margin: getMargin(
                                                  left: 34, bottom: 114)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorDeepOrange100,
                                              height: getSize(4.00),
                                              width: getSize(4.00),
                                              alignment: Alignment.bottomLeft,
                                              margin: getMargin(
                                                  left: 60, bottom: 111)),
                                          CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgVectorDeepOrange100,
                                              height: getSize(4.00),
                                              width: getSize(4.00),
                                              alignment: Alignment.bottomLeft,
                                              margin: getMargin(
                                                  left: 42, bottom: 110)),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(23.00),
                                                  width:
                                                      getHorizontalSize(18.00),
                                                  margin: getMargin(top: 89),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgSave,
                                                            height:
                                                                getVerticalSize(
                                                                    23.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    18.00),
                                                            alignment: Alignment
                                                                .center),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgFavoriteRedA200,
                                                            height:
                                                                getVerticalSize(
                                                                    6.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    8.00),
                                                            alignment: Alignment
                                                                .topCenter,
                                                            margin: getMargin(
                                                                top: 6))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(23.00),
                                                  width:
                                                      getHorizontalSize(18.00),
                                                  margin: getMargin(
                                                      left: 63, top: 8),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgVectorWhiteA70023x18,
                                                            height:
                                                                getVerticalSize(
                                                                    23.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    18.00),
                                                            alignment: Alignment
                                                                .center),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgFavoriteRedA200,
                                                            height:
                                                                getVerticalSize(
                                                                    6.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    8.00),
                                                            alignment: Alignment
                                                                .topCenter,
                                                            margin: getMargin(
                                                                top: 6))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(23.00),
                                                  width:
                                                      getHorizontalSize(18.00),
                                                  margin: getMargin(
                                                      right: 118, bottom: 53),
                                                  child: Stack(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgSave,
                                                            height:
                                                                getVerticalSize(
                                                                    23.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    18.00),
                                                            alignment: Alignment
                                                                .center),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgFavoriteRedA2006x8,
                                                            height:
                                                                getVerticalSize(
                                                                    6.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    8.00),
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            margin: getMargin(
                                                                bottom: 6))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(20.00),
                                                  width:
                                                      getHorizontalSize(16.00),
                                                  margin: getMargin(right: 89),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgSave,
                                                            height:
                                                                getVerticalSize(
                                                                    20.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    16.00),
                                                            alignment: Alignment
                                                                .center),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgVectorRedA2005x7,
                                                            height:
                                                                getVerticalSize(
                                                                    5.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    7.00),
                                                            alignment: Alignment
                                                                .topCenter,
                                                            margin: getMargin(
                                                                top: 5))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(16.00),
                                                  width:
                                                      getHorizontalSize(13.00),
                                                  margin: getMargin(top: 21),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgSave,
                                                            height:
                                                                getVerticalSize(
                                                                    16.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    13.00),
                                                            alignment: Alignment
                                                                .center),
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgVectorRedA2004x6,
                                                            height:
                                                                getVerticalSize(
                                                                    4.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    6.00),
                                                            alignment: Alignment
                                                                .topCenter,
                                                            margin: getMargin(
                                                                top: 4))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(15.00),
                                                  width:
                                                      getHorizontalSize(24.00),
                                                  margin: getMargin(
                                                      top: 25, right: 91),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgTicketWhiteA700,
                                                            height:
                                                                getVerticalSize(
                                                                    15.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    24.00),
                                                            alignment: Alignment
                                                                .center),
                                                        Align(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 4),
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVectorBlueGray800012x2,
                                                                          height: getSize(
                                                                              2.00),
                                                                          width:
                                                                              getSize(2.00)),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVectorBlueGray800012x2,
                                                                          height: getSize(
                                                                              2.00),
                                                                          width: getSize(
                                                                              2.00),
                                                                          margin:
                                                                              getMargin(left: 3)),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVector2x2,
                                                                          height: getSize(
                                                                              2.00),
                                                                          width: getSize(
                                                                              2.00),
                                                                          margin:
                                                                              getMargin(left: 3))
                                                                    ])))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(15.00),
                                                  width:
                                                      getHorizontalSize(24.00),
                                                  margin: getMargin(top: 30),
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgTicketWhiteA700,
                                                            height:
                                                                getVerticalSize(
                                                                    15.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    24.00),
                                                            alignment: Alignment
                                                                .center),
                                                        Align(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 4),
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVector2x2,
                                                                          height: getSize(
                                                                              2.00),
                                                                          width:
                                                                              getSize(2.00)),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVector2x2,
                                                                          height: getSize(
                                                                              2.00),
                                                                          width: getSize(
                                                                              2.00),
                                                                          margin:
                                                                              getMargin(left: 3)),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVector2x2,
                                                                          height: getSize(
                                                                              2.00),
                                                                          width: getSize(
                                                                              2.00),
                                                                          margin:
                                                                              getMargin(left: 3))
                                                                    ])))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(15.00),
                                                  width:
                                                      getHorizontalSize(24.00),
                                                  margin: getMargin(
                                                      right: 88, bottom: 88),
                                                  child: Stack(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgTicketWhiteA700,
                                                            height:
                                                                getVerticalSize(
                                                                    15.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    24.00),
                                                            alignment: Alignment
                                                                .center),
                                                        Align(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        bottom:
                                                                            4),
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVector2x2,
                                                                          height: getSize(
                                                                              2.00),
                                                                          width:
                                                                              getSize(2.00)),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVector6,
                                                                          height: getSize(
                                                                              2.00),
                                                                          width: getSize(
                                                                              2.00),
                                                                          margin:
                                                                              getMargin(left: 3)),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVector7,
                                                                          height: getSize(
                                                                              2.00),
                                                                          width: getSize(
                                                                              2.00),
                                                                          margin:
                                                                              getMargin(left: 3))
                                                                    ])))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Container(
                                                  height:
                                                      getVerticalSize(15.00),
                                                  width:
                                                      getHorizontalSize(24.00),
                                                  margin: getMargin(
                                                      left: 71, bottom: 66),
                                                  child: Stack(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      children: [
                                                        CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgTicketWhiteA700,
                                                            height:
                                                                getVerticalSize(
                                                                    15.00),
                                                            width:
                                                                getHorizontalSize(
                                                                    24.00),
                                                            alignment: Alignment
                                                                .center),
                                                        Align(
                                                            alignment: Alignment
                                                                .bottomCenter,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        bottom:
                                                                            4),
                                                                child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVector6,
                                                                          height: getSize(
                                                                              2.00),
                                                                          width:
                                                                              getSize(2.00)),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVector7,
                                                                          height: getSize(
                                                                              2.00),
                                                                          width: getSize(
                                                                              2.00),
                                                                          margin:
                                                                              getMargin(left: 3)),
                                                                      CustomImageView(
                                                                          svgPath: ImageConstant
                                                                              .imgVector6,
                                                                          height: getSize(
                                                                              2.00),
                                                                          width: getSize(
                                                                              2.00),
                                                                          margin:
                                                                              getMargin(left: 3))
                                                                    ])))
                                                      ])))
                                        ])))
                          ])),
                      Padding(
                          padding: getPadding(top: 23),
                          child: Text("msg_share_your_memories".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansBold24)),
                      Container(
                          width: getHorizontalSize(286.00),
                          margin: getMargin(top: 39),
                          child: Text("msg_post_your_amazing".tr,
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: AppStyle.txtNotoSansMedium16)),
                      Spacer(),
                      Padding(
                          padding: getPadding(left: 2),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtBack();
                                    },
                                    child: Text("lbl_back".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtNotoSansSemiBold18)),
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
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtNext();
                                    },
                                    child: Text("lbl_start".tr,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtNotoSansSemiBold18
                                            .copyWith(
                                                height: getVerticalSize(1.26))))
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
    Get.toNamed(AppRoutes.onboardingTwoScreen);
  }

  onTapTxtNext() {
    Get.toNamed(AppRoutes.signInScreen);
  }

  onTapTxtAlreadyhavean() {
    Get.toNamed(AppRoutes.signInScreen);
  }
}
