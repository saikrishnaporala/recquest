import 'package:basic_utils/basic_utils.dart';
import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/presentation/event_details_about_screen/models/event_display_model.dart';
import 'package:recquest_21/presentation/mainhome_page/models/mainhome_item_model.dart';
import 'package:recquest_21/presentation/mainhome_page/widgets/mainhome_item_widget.dart';
import 'package:recquest_21/presentation/organizer_profile_about_screen/models/review_item_model.dart';
import 'package:recquest_21/presentation/organizer_profile_about_screen/widgets/event_item_widget.dart';
import 'package:recquest_21/presentation/organizer_profile_about_screen/widgets/review_widget.dart';
import 'package:recquest_21/widgets/app_bar/appbar_circleimage.dart';

import 'controller/organizer_profile_about_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/widgets/app_bar/appbar_image.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';
import 'package:recquest_21/widgets/custom_button.dart';

class OrganizerProfileAboutScreen
    extends GetWidget<OrganizerProfileAboutController> {
  @override
  Widget build(BuildContext context) {
    
    dynamic argData = Get.arguments;
    
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorConstant.gray10001,
        appBar: CustomAppBar(
            height: getVerticalSize(56.00),
            leadingWidth: 32,
            leading: AppbarImage(
                height: getSize(16.00),
                width: getSize(16.00),
                svgPath: ImageConstant.imgArrowleft,
                margin: getMargin(left: 16, top: 15, bottom: 15),
                onTap: onTapArrowleft),
            title: AppbarSubtitle(
                text: "msg_organizer_profile".tr, margin: getMargin(left: 16)),
            styleType: Style.bgFillWhiteA700),
        body: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                padding: getPadding(left: 15, top: 10, right: 15, bottom: 10),
                decoration: AppDecoration.outlineBlack9003f,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    argData.profilePhotoPath != null
                        ? AppbarCircleimage(
                            imagePath: argData.profilePhotoPath,
                            margin: getMargin(left: 23, top: 10, bottom: 10),
                          )
                        : Container(
                            margin: getMargin(left: 10, top: 10, bottom: 10),
                            child: CustomImageView(
                              imagePath: ImageConstant.userIcon,
                              height: getSize(50.00),
                              width: getSize(50.00),
                              radius: BorderRadius.circular(
                                  getHorizontalSize(54.00)),
                            ),
                          ),
                    Padding(
                      padding: getPadding(top: 11),
                      child: Text(
                          StringUtils.capitalize(argData.firstname +
                              " " +
                              StringUtils.capitalize(argData.lastname)),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtNotoSansSemiBold18
                              .copyWith(height: getVerticalSize(1.19))),
                    ),
                    Container(
                        width: getHorizontalSize(
                            MediaQuery.of(context).size.width - 120),
                        child: Text(argData.email,
                            maxLines: null,
                            textAlign: TextAlign.center,
                            style: AppStyle.txtNotoSansMedium16)),
                    Container(
                      width: getHorizontalSize(345.00),
                      margin: getMargin(top: 10, bottom: 5),
                      child: argData.about == null
                          ? Text(
                              " ",
                              style: TextStyle(
                                  color: ColorConstant.blueGray80002,
                                  fontSize: getFontSize(14),
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w400,
                                  height: getVerticalSize(1.19)),
                            )
                          : RichText(
                              text: TextSpan(
                                text: argData.about.toString(),
                                style: TextStyle(
                                  color: ColorConstant.black900,
                                  fontSize: getFontSize(14),
                                  fontFamily: 'Noto Sans',
                                  fontWeight: FontWeight.w400,
                                  height: getVerticalSize(1.19),
                                ),
                              ),
                              textAlign: TextAlign.left),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                padding: getPadding(top: 10, left: 0, right: 0),
                child: MainhomeItemWidget(
                  eventList: controller.getEventsByUser(argData.id)
                )
              )),
            ],
          ),
        ),
      ),
    );
  }

  onTapArrowleft() {
    Get.back();
  }

  openIndividualEvent(String id) async {
    try {
      APIHandler apiClient = APIHandler();
      print(id);
      dynamic response = await apiClient.get(
        '/eventById/$id',
        isAuthenticated: true,
      );

      dynamic resondeData = response.data;
      print(resondeData);
      EventDisplayModel eventDisplayModel =
          EventDisplayModel.fromJson(response.data);
      Get.toNamed(AppRoutes.eventDetailsAboutScreen,
          arguments: eventDisplayModel);
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }

  onTapVenue() {
    Get.toNamed(AppRoutes.mapViewScreen);
  }

  void onTapCategoryName() {}
}
