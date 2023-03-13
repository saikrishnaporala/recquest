import 'dart:io';

import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:recquest_21/presentation/share_screen/widgets/user_item_widget.dart';
import 'package:recquest_21/widgets/app_bar/appbar_image.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';

import 'controller/share_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';

class ShareScreen extends GetWidget<ShareController> {
  dynamic argData = Get.arguments;

  final Rxn<int> selected = Rxn<int>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
          height: getVerticalSize(50.00),
          leadingWidth: 32,
          leading: AppbarImage(
              height: getSize(16.00),
              width: getSize(16.00),
              svgPath: ImageConstant.imgArrowleft,
              margin: getMargin(left: 16, top: 15, bottom: 15),
              onTap: onTapArrowleft),
          title: AppbarSubtitle(
              text: argData[1]["title"] + " Images",
              margin: getMargin(left: 16)),
          actions: [
            GestureDetector(
              onTap: () {
                onTapShareImagesToUsers();
              },
              child: Container(
                width: 44,
                height: 44,
                margin: getMargin(
                  right: 5,
                ),
                alignment: AlignmentDirectional(0, 0),
                child: Icon(
                  Icons.share,
                  color: ColorConstant.pink800,
                ),
              ),
            ),
          ],
          styleType: Style.bgFillWhiteA700),
      body: Container(
          width: size.width,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
              child: Container(
                child: UserListWidget(userlist: Get.arguments[3]["usersList"]),
              ),
            )
          ])),
    ));
  }

  onTapArrowleft() {
    Get.back();
  }

  Future<void> onTapShareImagesToUsers() async {
    APIHandler apiClient = APIHandler();
    // var formData = new FormData();

    Get.arguments[2]['selectedImages'].forEach((element) {
      // File('Get.arguments[0]['folderPath']/element');
      print(Get.arguments[0]['folderPath'] + '/' + element);
    });

    Get.snackbar(
      'Success',
      "Selected images are successfully shared to the users",
      backgroundColor: Color.fromARGB(255, 0, 160, 27),
    );
    // Get.arguments[3]['usersList'].forEach((element) {
    //   if (controller.selectedUsers.contains(element.id)) {
    //     print(element);
    //   } else {
    //     print(false);
    //   }
    // });
    // for (var name in controller.selectedUsers) {
    //   print(name);

    //   dynamic imageobjects = {
    //     "latitude": BackgroundController.instance.latitude,
    //     "longitude": BackgroundController.instance.longitude,
    //     "distance": 1
    //   };
    //   dynamic response = await apiClient.post('/savePicture',
    //       isAuthenticated: true, data: imageobjects);
    // }
  }
}

class UserListWidget extends StatefulWidget {
  UserListWidget({Key? key, required this.userlist}) : super(key: key);
  final List<MyProfileModel> userlist;

  @override
  UserItemWidgetState createState() => new UserItemWidgetState();
}
