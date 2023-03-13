import 'controller/photo_open_overlay_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';

class PhotoOpenOverlayScreen extends GetWidget<PhotoOpenOverlayController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgPhotoopenoverlay,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  margin: getMargin(
                    bottom: 5,
                  ),
                  padding: getPadding(
                    left: 14,
                    top: 42,
                    right: 14,
                    bottom: 42,
                  ),
                  decoration: AppDecoration.gradientBlack900Gray40000,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(
                        height: getVerticalSize(
                          56.00,
                        ),
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: getPadding(
                                left: 52,
                                right: 216,
                              ),
                              child: Text("lbl_ridhwan_nordin".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtNotoSansMedium16),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: getPadding(
                                  left: 52,
                                  right: 268,
                                ),
                                child: Text("lbl_ridzjcob".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtNotoSansMedium16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imageNotFound,
                        height: getSize(
                          28.00,
                        ),
                        width: getSize(
                          28.00,
                        ),
                        radius: BorderRadius.circular(
                          getHorizontalSize(
                            14.00,
                          ),
                        ),
                        margin: getMargin(
                          top: 3,
                          bottom: 183,
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgCloseWhiteA700,
                        height: getSize(
                          32.00,
                        ),
                        width: getSize(
                          32.00,
                        ),
                        margin: getMargin(
                          top: 1,
                          bottom: 181,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
