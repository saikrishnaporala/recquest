import 'controller/notifications_empty_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';

class NotificationsEmptyScreen extends GetWidget<NotificationsEmptyController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray10001,
        body: Container(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                padding: getPadding(
                  left: 108,
                  top: 10,
                  right: 108,
                  bottom: 10,
                ),
                decoration: AppDecoration.fillBluegray90002,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: getPadding(
                        bottom: 3,
                      ),
                      child: Text(
                        "lbl_notifications".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtNotoSansBold24.copyWith(
                          height: getVerticalSize(
                            1.00,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              CustomImageView(
                svgPath: ImageConstant.imgArtwork,
                height: getVerticalSize(
                  169.00,
                ),
                width: getHorizontalSize(
                  155.00,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 42,
                ),
                child: Text(
                  "msg_no_notifications".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtNotoSansSemiBold18.copyWith(
                    height: getVerticalSize(
                      1.26,
                    ),
                  ),
                ),
              ),
              Container(
                width: getHorizontalSize(
                  326.00,
                ),
                margin: getMargin(
                  top: 14,
                  bottom: 143,
                ),
                child: Text(
                  "msg_lorem_ipsum_dolor".tr,
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtNotoSansMedium16.copyWith(
                    height: getVerticalSize(
                      1.17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
