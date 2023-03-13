import 'controller/search_event_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/widgets/app_bar/appbar_button.dart';
import 'package:recquest_21/widgets/app_bar/appbar_circleimage.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';
import 'package:recquest_21/widgets/custom_button.dart';
import 'package:recquest_21/widgets/custom_icon_button.dart';
import 'package:recquest_21/widgets/custom_search_view.dart';

class SearchEventListScreen extends GetWidget<SearchEventListController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray10001,
            appBar: CustomAppBar(
                height: getVerticalSize(60.00),
                leadingWidth: 53,
                leading: AppbarCircleimage(
                    imagePath: ImageConstant.imageNotFound,
                    margin: getMargin(left: 13, top: 10, bottom: 10)),
                title: CustomSearchView(
                    width: 191,
                    focusNode: FocusNode(),
                    controller: controller.searchController,
                    hintText: "lbl_search2".tr,
                    margin: getMargin(left: 20),
                    padding: SearchViewPadding.PaddingT5,
                    fontStyle: SearchViewFontStyle.NotoSansBoldItalic14,
                    suffix: Padding(
                        padding:
                            EdgeInsets.only(right: getHorizontalSize(15.00)),
                        child: IconButton(
                            onPressed: () {
                              controller.searchController.clear;
                            },
                            icon: Icon(Icons.clear,
                                color: Colors.grey.shade600))),
                    suffixConstraints:
                        BoxConstraints(maxHeight: getVerticalSize(35.00))),
                actions: [
                  AppbarButton(
                      margin:
                          getMargin(left: 13, top: 14, right: 13, bottom: 14),
                      onTap: onTapFilters2)
                ],
                styleType: Style.bgFillBluegray90002),
            body: Container(
                width: size.width,
                padding: getPadding(left: 37, right: 37),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          margin: getMargin(left: 2, right: 2),
                          padding: getPadding(all: 5),
                          decoration: AppDecoration.fillBlack90007.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder23),
                          child: Row(children: [
                            CustomButton(
                                height: 35,
                                width: 145,
                                text: "lbl_upcoming".tr,
                                variant: ButtonVariant.OutlineBlack90019,
                                shape: ButtonShape.RoundedBorder17,
                                fontStyle: ButtonFontStyle.NotoSansBold15),
                            Padding(
                                padding: getPadding(
                                    left: 20, top: 7, right: 21, bottom: 4),
                                child: Text("lbl_past_events".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtNotoSansMedium16))
                          ])),
                      CustomImageView(
                          svgPath: ImageConstant.imgGroup33596,
                          height: getSize(202.00),
                          width: getSize(202.00),
                          margin: getMargin(top: 10)),
                      Padding(
                          padding: getPadding(top: 33),
                          child: Text("msg_no_upcoming_events".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansBold24)),
                      Container(
                          height: getVerticalSize(50.00),
                          width: getHorizontalSize(300.00),
                          margin: getMargin(top: 8, bottom: 6),
                          child: Stack(alignment: Alignment.center, children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    padding: getPadding(
                                        left: 14,
                                        top: 10,
                                        right: 14,
                                        bottom: 10),
                                    decoration: AppDecoration.fillPink80001
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder14),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          CustomIconButton(
                                              height: 30,
                                              width: 30,
                                              variant: IconButtonVariant
                                                  .FillWhiteA700,
                                              shape: IconButtonShape
                                                  .CircleBorder15,
                                              child: CustomImageView(
                                                  svgPath: ImageConstant
                                                      .imgArrowright))
                                        ]))),
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                    "lbl_explore_events".tr.toUpperCase(),
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtNotoSansMedium16))
                          ]))
                    ]))));
  }

  onTapFilters2() {
    Get.toNamed(AppRoutes.filtersScreen);
  }
}
