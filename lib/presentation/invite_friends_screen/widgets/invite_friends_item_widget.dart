import 'package:provider/provider.dart';

import '../controller/invite_friends_controller.dart';
import '../models/contact_local.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';

// ignore: must_be_immutable
class InviteFriendsItemWidget extends StatelessWidget {
  InviteFriendsItemWidget(this.contactObj);

  ContactLocal contactObj;
  var controller = Get.find<InviteFriendsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // CustomImageView(
        //   imagePath: ImageConstant.imgEllipse58,
        //   height: getSize(
        //     42.00,
        //   ),
        //   width: getSize(
        //     42.00,
        //   ),
        //   radius: BorderRadius.circular(
        //     getHorizontalSize(
        //       21.00,
        //     ),
        //   ),
        // ),
        Padding(
          padding: getPadding(all: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                contactObj.name,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtNotoSansMedium16.copyWith(
                  height: getVerticalSize(
                    1.00,
                  ),
                ),
              ),
              Text(
                contactObj.phoneNumber,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtNotoSansRegular12.copyWith(
                  height: getVerticalSize(
                    1.00,
                  ),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: getPadding(all: 10),
          child: ChangeNotifierProvider(
            create: (_) => CheckboxProvider(),
            child: Consumer<CheckboxProvider>(
              builder: (context, checkboxProvider, _) => Checkbox(
                value: checkboxProvider.isChecked,
                onChanged: (value) {
                  checkboxProvider.isChecked = value ?? true;
                  contactObj.isSelected = checkboxProvider.isChecked;
                },
              ),
            ),
          ),
        ),
        // CheckboxListTile(
        //   title: Text(contactObj.name.toString()),
        //   value: contactObj.isSelected,
        //   onChanged: (value) {
        //     contactObj.isSelected = value!;
        //   },
        //   // shape: const CircleBorder(),
        //   // checkColor: Colors.white,
        //   // activeColor: Colors.green,
        //   // tileColor: Color.fromARGB(118, 230, 229, 229),
        // ),
      ],
    );
  }
}

class CheckboxProvider with ChangeNotifier {
  var controller = Get.find<InviteFriendsController>();
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  set isChecked(bool value) {
    if (controller.selectionCount < 1) {
      _isChecked = value;
      controller.selectionCount++;
      notifyListeners();
    } else {
      Get.snackbar('Error', "Exceeds number of selection");
    }
  }
}
