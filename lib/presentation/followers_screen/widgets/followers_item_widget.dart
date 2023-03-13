import '../controller/followers_controller.dart';
import '../models/followers_item_model.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';

// ignore: must_be_immutable
class FollowersItemWidget extends StatelessWidget {
  FollowersItemWidget(this.followersItemModelObj);

  FollowersItemModel followersItemModelObj;

  var controller = Get.find<FollowersController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgEllipse58,
          height: getSize(
            42.00,
          ),
          width: getSize(
            42.00,
          ),
          radius: BorderRadius.circular(
            getHorizontalSize(
              21.00,
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 9,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "lbl_alex_lee".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtNotoSansMedium16.copyWith(
                  height: getVerticalSize(
                    1.00,
                  ),
                ),
              ),
              Text(
                "lbl_2k_follwers".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtNotoSansMedium16.copyWith(
                  height: getVerticalSize(
                    1.00,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
