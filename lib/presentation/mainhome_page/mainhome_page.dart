import 'package:recquest_21/presentation/mainhome_page/widgets/mainhome_item_widget.dart';
import 'package:recquest_21/utils/background_controller.dart';

import 'controller/mainhome_controller.dart';
import 'models/mainhome_model.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/widgets/app_bar/appbar_circleimage.dart';
import 'package:recquest_21/widgets/app_bar/appbar_image.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle_3.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';

// ignore_for_file: must_be_immutable
class MainhomePage extends StatelessWidget {
  MainhomeController controller =
      Get.put(MainhomeController(MainhomeModel().obs));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.gray10001,
      appBar: CustomAppBar(
          height: getVerticalSize(60.00),
          leadingWidth: 53,
          leading: BackgroundController.instance.myProfileModelObj.value
                      .profilePhotoPath.isBlank ==
                  null
              ? AppbarCircleimage(
                  imagePath: BackgroundController
                      .instance.myProfileModelObj.value.profilePhotoPath,
                  margin: getMargin(left: 23, top: 10, bottom: 10),
                  onTap: () {
                        onTapMyProfile();
                      },)
              : Container(
                  margin: getMargin(left: 10, top: 10, bottom: 10),
                  child: CustomImageView(
                      imagePath: ImageConstant.userIcon,
                      height: getSize(108.00),
                      width: getSize(108.00),
                      radius: BorderRadius.circular(getHorizontalSize(54.00)),
                      onTap: () {
                        onTapMyProfile();
                      })),
          title: Row(children: [
            Padding(
                padding: getPadding(left: 54, top: 12, bottom: 15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppbarSubtitle4(text: "msg_current_location".tr),
                      Obx(() => AppbarSubtitle3(
                          text: BackgroundController.instance.address.value,
                          margin: getMargin(left: 4, right: 2)))
                    ])),
          ]),
          actions: [
            AppbarImage(
                height: getSize(40.00),
                width: getSize(40.00),
                svgPath: ImageConstant.imgFloatingicon,
                margin: getMargin(right: 10, top: 10, bottom: 10),
                onTap: onTapFloatingicon)
          ],
          styleType: Style.bgFillBluegray90002),
      body: MainhomeItemWidget(
        eventList: controller.getApi(),
      ),

     
    ));
  }

  onTapMyProfile() {
    print("myprofile");
    Get.toNamed(AppRoutes.myProfileScreen);
  }

  onTapFloatingicon() {
    Get.toNamed(AppRoutes.notificationsListScreen);
  }
}
