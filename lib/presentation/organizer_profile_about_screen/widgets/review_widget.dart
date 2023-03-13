// import 'package:recquest_21/presentation/organizer_profile_about_screen/models/review_item_model.dart';

import 'package:recquest_21/presentation/organizer_profile_about_screen/controller/organizer_profile_about_controller.dart';
import 'package:recquest_21/presentation/organizer_profile_about_screen/models/review_item_model.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';

// ignore: must_be_immutable
class ReviewWidget extends StatelessWidget {
  ReviewWidget(this.reviewItemModelObj);

  ReviewItemModel reviewItemModelObj;

  var controller = Get.find<OrganizerProfileAboutController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse52,
            height: getSize(
              34.00,
            ),
            width: getSize(
              34.00,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                17.00,
              ),
            ),
            margin: getMargin(
              top: 4,
              bottom: 73,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 17,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    left: 2,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: getPadding(
                          top: 6,
                        ),
                        child: Text("msg_rocks_velkeinjen".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtNotoSansMedium16),
                      ),
                      Padding(
                        padding: getPadding(
                          left: 106,
                          bottom: 6,
                        ),
                        child: Text("lbl_10_feb".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtNotoSansMedium16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 3,
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgStar,
                        height: getVerticalSize(
                          19.00,
                        ),
                        width: getHorizontalSize(
                          20.00,
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgStar,
                        height: getVerticalSize(
                          19.00,
                        ),
                        width: getHorizontalSize(
                          20.00,
                        ),
                        margin: getMargin(
                          left: 1,
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgStar,
                        height: getVerticalSize(
                          19.00,
                        ),
                        width: getHorizontalSize(
                          20.00,
                        ),
                        margin: getMargin(
                          left: 1,
                        ),
                      ),
                      CustomImageView(
                        svgPath: ImageConstant.imgStar,
                        height: getVerticalSize(
                          19.00,
                        ),
                        width: getHorizontalSize(
                          20.00,
                        ),
                        margin: getMargin(
                          left: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: getHorizontalSize(
                    280.00,
                  ),
                  margin: getMargin(
                    left: 2,
                    top: 7,
                  ),
                  child: Text("msg_cinemas_is_the_ultimate".tr,
                      maxLines: null,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtNotoSansMedium16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
