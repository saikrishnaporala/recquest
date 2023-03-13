import '../followers_screen/widgets/followers_item_widget.dart';
import 'controller/followers_controller.dart';
import 'models/followers_item_model.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/widgets/app_bar/appbar_image.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';

class FollowersScreen extends GetWidget<FollowersController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray10001,
            appBar: CustomAppBar(
                height: getVerticalSize(56.00),
                leadingWidth: 32,
                leading: AppbarImage(
                    height: getSize(16.00),
                    width: getSize(16.00),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 16, top: 15, bottom: 15),
                    onTap: onTapArrowleft10),
                title: AppbarSubtitle(
                    text: "lbl_followers".tr, margin: getMargin(left: 16)),
                styleType: Style.bgFillWhiteA700),
            body: Padding(
                padding: getPadding(left: 16, top: 10, right: 210),
                child: Obx(() => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(9.00));
                    },
                    itemCount: controller
                        .followersModelObj.value.followersItemList.length,
                    itemBuilder: (context, index) {
                      FollowersItemModel model = controller
                          .followersModelObj.value.followersItemList[index];
                      return FollowersItemWidget(model);
                    })))));
  }

  onTapArrowleft10() {
    Get.back();
  }
}
