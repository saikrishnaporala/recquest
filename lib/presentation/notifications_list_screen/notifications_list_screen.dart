import 'package:basic_utils/basic_utils.dart';
import 'package:intl/intl.dart';
import 'package:recquest_21/presentation/notifications_list_screen/models/notifications_model.dart';
import 'package:recquest_21/widgets/app_bar/appbar_circleimage.dart';
import 'package:recquest_21/widgets/app_bar/appbar_image.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';

import 'controller/notifications_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';

class NotificationsListScreen extends GetWidget<NotificationsListController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray10001,
        appBar: CustomAppBar(
            height: getVerticalSize(56.00),
            leadingWidth: 32,
            leading: AppbarImage(
                height: getSize(24.00),
                width: getSize(24.00),
                svgPath: ImageConstant.imgArrowleft,
                margin: getMargin(left: 16, top: 15, bottom: 15),
                onTap: () {
                  Navigator.pop(context);
                }),
            title: AppbarSubtitle(
                text: "lbl_notifications".tr, margin: getMargin(left: 16)),
            styleType: Style.bgFillWhiteA700),
        body: Container(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Scrollbar(
                child: Center(
                    child: controller.notificationsListModelObj.value
                            .notificationItemList.isNotEmpty
                        ? Text("No Records Found",
                            style: AppStyle.txtNotoSansMedium16)
                        : Obx(() => ListView.separated(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return SizedBox(height: getVerticalSize(10.00));
                            },
                            itemCount: controller.notificationsListModelObj
                                .value.notificationItemList.length,
                            itemBuilder: (context, index) {
                              NotificationsModel model = controller
                                  .notificationsListModelObj
                                  .value
                                  .notificationItemList[index];
                              return Container(
                                width: double.maxFinite,
                                child: Container(
                                  margin: getMargin(
                                      left: 10, right: 10),
                                  decoration:
                                      AppDecoration.outlineGray30002.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder6,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: getPadding(
                                          top: 7,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            
                                                  model.profilePhotoPath
                                                              .isBlank ==
                                                          null
                                                      ? AppbarCircleimage(
                                                          imagePath: model
                                                              .profilePhotoPath,
                                                          margin: getMargin(
                                                              left: 23,
                                                              top: 10,
                                                              bottom: 10),
                                                          onTap: () {
                                                            onTapSenderProfile(
                                                                model.senderId);
                                                          },
                                                        )
                                                      : Container(
                                                          margin: getMargin(
                                                              left: 10,
                                                              top: 10,
                                                              bottom: 10),
                                                          child:
                                                              CustomImageView(
                                                                  imagePath:
                                                                      ImageConstant
                                                                          .userIcon,
                                                                  height:
                                                                      getSize(
                                                                          40.00),
                                                                  width: getSize(
                                                                      40.00),
                                                                  radius: BorderRadius
                                                                      .circular(
                                                                          getHorizontalSize(
                                                                              54.00)),
                                                                  onTap: () {
                                                                    onTapSenderProfile(
                                                                        model
                                                                            .senderId);
                                                                  })),
                                                  Padding(
                                                    padding: getPadding(
                                                        top: 10, left: 14),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding: getPadding(
                                                              left: 2),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width -
                                                                    120,
                                                                child: Text(
                                                                  StringUtils.capitalize(model
                                                                              .firstname
                                                                              .toString() +
                                                                          " " +
                                                                          StringUtils.capitalize(model
                                                                              .lastname
                                                                              .toString())) +
                                                                      " invited you for the event " +
                                                                      model.body
                                                                          .toString() +
                                                                      " dated on " +
                                                                      DateFormat.yMMMd().format(DateTime.parse(model
                                                                          .createdAt
                                                                          .toString())),
                                                                  maxLines: 3,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: AppStyle
                                                                      .txtNotoSansRegular12,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                    ],
                                  ),
                                  ),
                              );
                            }))),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void onTapSenderProfile(int? senderId) {}
}
