import 'dart:developer';

import 'package:basic_utils/basic_utils.dart';
import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:recquest_21/widgets/app_bar/appbar_circleimage.dart';

import '../controller/following_controller.dart';
import '../models/following_item_model.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';

// ignore: must_be_immutable
class FollowingItemWidget extends StatelessWidget {
  FollowingItemWidget(this.followingItemModelObj);

  FollowingItemModel followingItemModelObj;

  var controller = Get.find<FollowingController>();

  @override
  Widget build(BuildContext context) {
    return 
        Row(
          children: [
            followingItemModelObj.profilePhotoPath != null
                ? AppbarCircleimage(
                    imagePath: followingItemModelObj.profilePhotoPath,
                    margin: getMargin(left: 23, top: 10, bottom: 10),
                    onTap: onTapUserProfile(followingItemModelObj.userId))
                : Container(
                    margin: getMargin(left: 10, top: 0, bottom: 0),
                    child: CustomImageView(
                        imagePath: ImageConstant.userIcon,
                        height: getSize(50.00),
                        width: getSize(50.00),
                        radius: BorderRadius.circular(getHorizontalSize(54.00)),
                        onTap: () {
                          onTapOrgProfile(followingItemModelObj.userId);
                        }),
                  ),
            Padding(
              padding: getPadding(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                        onTapOrgProfile(followingItemModelObj.userId);
                    },
                    child: Container(
                      child: Text(
                        StringUtils.capitalize(
                            followingItemModelObj.firstname.toString() +
                                " " +
                                StringUtils.capitalize(
                                    followingItemModelObj.lastname.toString())),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtNotoSansRegular12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
  }

  onTapUserProfile(int? userId) {
    Get.toNamed(AppRoutes.organizerProfileAboutScreen);
  }

  onTapOrgProfile(id) async {
    APIHandler apiClient = APIHandler();

    try {
      dynamic response =
          await apiClient.get('/userById/$id', isAuthenticated: true);

      MyProfileModel orgDisplayModel = MyProfileModel.fromJson(response.data);
      print(orgDisplayModel);
      Get.toNamed(AppRoutes.organizerProfileAboutScreen,
          arguments: orgDisplayModel);
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
    } finally {
      // isDataLoading;
    }
  }
}
