import 'dart:convert';

import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/presentation/invite_friends_screen/models/contact_local.dart';
import 'package:recquest_21/widgets/app_bar/appbar_image.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';
import 'package:recquest_21/widgets/custom_button.dart';

import '../invite_friends_screen/widgets/invite_friends_item_widget.dart';
import 'controller/invite_friends_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';

class InviteFriendsScreen extends GetWidget<InviteFriendsController> {
  dynamic argData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorConstant.gray10001,
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
                text: "lbl_invite_friend".tr, margin: getMargin(left: 16)),
            styleType: Style.bgFillWhiteA700),
        body: Container(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Obx(
                  () => controller.contacts1.isEmpty
                      ? Text("No Records Found",
                          style: AppStyle.txtNotoSansMedium16)
                      : Scrollbar(
                          interactive: true,
                          thickness: 24,
                          child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Obx(() => ListView.builder(
                                    itemCount: controller.contacts1.length,
                                    itemBuilder: (context, index) {
                                      ContactLocal contact =
                                          controller.contacts1[index];
                                      return InviteFriendsItemWidget(
                                        contact,
                                      );
                                    },
                                  ))),
                        ),
                ),
              ),
              CustomButton(
                  height: 48,
                  width: 338,
                  text: "lbl_invite".tr.toUpperCase(),
                  margin: getMargin(left: 3, top: 14),
                  shape: ButtonShape.RoundedBorder14,
                  padding: ButtonPadding.PaddingAll9,
                  fontStyle: ButtonFontStyle.NotoSansBold16,
                  onTap: onSendInvite),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onSendInvite() async {
    print(argData);
    print(controller.contacts1);

    final copiedList = controller.contacts1.where((item) => 
      item.isSelected == true
    ).toList();
    print(copiedList);

    try {
      APIHandler apiClient = APIHandler();
      dynamic reviewDataObj = {
        'eventData': argData.id.toString(),
        'eventTitle': argData.title.toString(),
        'selectedList': copiedList
      };

      dynamic response = await apiClient.post('/sendInviteToFriends',
          data: reviewDataObj, isAuthenticated: true);

      dynamic responseData = response.data;
      print(responseData);
      if (responseData['message'] == 201) {
        Get.snackbar('Success', responseData['message']);
        // Navigator.pop(context);
      } else {
        Get.snackbar('Error', "Failed to submit, try again");
      }
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }

  onTapArrowleft() {
    Get.back();
  }
}
