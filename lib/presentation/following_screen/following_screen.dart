import '../following_screen/widgets/following_item_widget.dart';
import 'controller/following_controller.dart';
import 'models/following_item_model.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/widgets/app_bar/appbar_image.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';

class FollowingScreen extends GetWidget<FollowingController> {

  dynamic argData = Get.arguments;
  
  @override
  Widget build(BuildContext context) {
    print(argData);
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
                    onTap: onTapArrowleft11),
                title: AppbarSubtitle(
                    text: "lbl_following".tr, margin: getMargin(left: 16)),
                styleType: Style.bgFillWhiteA700),
            body: Padding(
                padding: getPadding(left: 5, top: 5),
                child:  Obx(
                  () => controller.followingModelObj.value.followingItemList.isEmpty
                      ? Text("No Followers",
                          style: AppStyle.txtNotoSansMedium16)
                      : ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: getVerticalSize(9.00));
                    },
                    itemCount: controller.followingModelObj.value.followingItemList.length,
                    itemBuilder: (context, index) {
                      FollowingItemModel model = controller.followingModelObj.value.followingItemList[index];
                      return FollowingItemWidget(model);
                    })))));
  }

  onTapArrowleft11() {
    Get.back();
  }
}
