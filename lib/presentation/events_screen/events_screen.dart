import 'package:recquest_21/presentation/mainhome_page/widgets/mainhome_item_widget.dart';
import 'package:recquest_21/utils/background_controller.dart';

import 'controller/events_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/widgets/app_bar/appbar_circleimage.dart';
import 'package:recquest_21/widgets/app_bar/appbar_image.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle_3.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle_4.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';

class EventsScreen extends GetWidget<EventsController> {
  get onTapFilters1 => null;
  @override
  Widget build(BuildContext context) {
    final EventsController controller =
        Get.put(EventsController(), permanent: false);

    return SafeArea(
        child: Scaffold(
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
                  onTap: onTapMyProfile)
              : Container(
                  margin: getMargin(left: 10, top: 10, bottom: 10),
                  child: CustomImageView(
                      imagePath: ImageConstant.userIcon,
                      // height: getSize(108.00),
                      // width: getSize(108.00),
                      radius: BorderRadius.circular(getHorizontalSize(54.00))),
                ),
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
        eventList: controller.getEvents(),
      ),
      // controller.eventsModelObj.value.eventsItemList.isEmpty
      //     ? Container(
      //         width: size.width,
      //         padding: getPadding(left: 37, right: 37),
      //         child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Container(
      //                   margin: getMargin(left: 2, right: 2),
      //                   padding: getPadding(all: 5),
      //                   decoration: AppDecoration.fillBlack90007.copyWith(
      //                       borderRadius:
      //                           BorderRadiusStyle.circleBorder23),
      //                   child: Row(children: [
      //                     CustomButton(
      //                         height: 35,
      //                         width: 145,
      //                         text: "lbl_upcoming".tr,
      //                         variant: ButtonVariant.OutlineBlack90019,
      //                         shape: ButtonShape.RoundedBorder17,
      //                         fontStyle: ButtonFontStyle.NotoSansBold15),
      //                     Padding(
      //                         padding: getPadding(
      //                             left: 20, top: 7, right: 21, bottom: 4),
      //                         child: Text("lbl_past_events".tr,
      //                             overflow: TextOverflow.ellipsis,
      //                             textAlign: TextAlign.left,
      //                             style: AppStyle.txtNotoSansMedium16))
      //                   ])),
      //               CustomImageView(
      //                   svgPath: ImageConstant.imgGroup33596,
      //                   height: getSize(202.00),
      //                   width: getSize(202.00),
      //                   margin: getMargin(top: 10)),
      //               Padding(
      //                   padding: getPadding(top: 33),
      //                   child: Text("msg_no_upcoming_events".tr,
      //                       overflow: TextOverflow.ellipsis,
      //                       textAlign: TextAlign.left,
      //                       style: AppStyle.txtNotoSansBold24)),
      //               Container(
      //                   height: getVerticalSize(50.00),
      //                   width: getHorizontalSize(300.00),
      //                   margin: getMargin(top: 8, bottom: 6),
      //                   child:
      //                       Stack(alignment: Alignment.center, children: [
      //                     Align(
      //                         alignment: Alignment.center,
      //                         child: Container(
      //                             padding: getPadding(
      //                                 left: 14,
      //                                 top: 10,
      //                                 right: 14,
      //                                 bottom: 10),
      //                             decoration: AppDecoration.fillPink80001
      //                                 .copyWith(
      //                                     borderRadius: BorderRadiusStyle
      //                                         .circleBorder14),
      //                             child: Column(
      //                                 mainAxisSize: MainAxisSize.min,
      //                                 crossAxisAlignment:
      //                                     CrossAxisAlignment.end,
      //                                 mainAxisAlignment:
      //                                     MainAxisAlignment.start,
      //                                 children: [
      //                                   CustomIconButton(
      //                                       height: 30,
      //                                       width: 30,
      //                                       variant: IconButtonVariant
      //                                           .FillWhiteA700,
      //                                       shape: IconButtonShape
      //                                           .CircleBorder15,
      //                                       child: CustomImageView(
      //                                           svgPath: ImageConstant
      //                                               .imgArrowright))
      //                                 ]))),
      //                     Align(
      //                         alignment: Alignment.center,
      //                         child: Text(
      //                             "lbl_explore_events".tr.toUpperCase(),
      //                             overflow: TextOverflow.ellipsis,
      //                             textAlign: TextAlign.left,
      //                             style: AppStyle.txtNotoSansMedium16))
      //                   ]))
      //             ]))
      //     : Padding(
      //         padding: getPadding(left: 12, top: 12, right: 12),
      //         child: Obx(() => ListView.separated(
      //             physics: BouncingScrollPhysics(),
      //             shrinkWrap: true,
      //             separatorBuilder: (context, index) {
      //               return SizedBox(height: getVerticalSize(10.00));
      //             },
      //             itemCount: controller
      //                 .eventsModelObj.value.eventsItemList.length,
      //             itemBuilder: (context, index) {
      //               MainhomeItemModel model = controller
      //                   .eventsModelObj.value.eventsItemList[index];
      //               return Text("lbl_explore_events".tr.toUpperCase(),
      //                   overflow: TextOverflow.ellipsis,
      //                   textAlign: TextAlign.left,
      //                   style: AppStyle.txtNotoSansMedium16);
      //               //MainhomeItemWidget(model);
      //             })))
    ));
  }

  onTapImgEllipseThirteen() {
    Get.toNamed(AppRoutes.organizerProfileAboutScreen);
  }

  onTapTxtInternationalBand() {
    Get.toNamed(AppRoutes.eventDetailsAboutScreen);
  }

  onTapTxtLanguage() {
    Get.toNamed(AppRoutes.mapViewScreen);
  }

  onTapFloatingicon1() {
    Get.toNamed(AppRoutes.notificationsListScreen);
  }

  onTapContrast1() {
    Get.toNamed(AppRoutes.searchEventsScreen);
  }

  onTapFloatingicon() {}

  onTapMyProfile() {
    Get.toNamed(AppRoutes.myProfileScreen);
  }
}
