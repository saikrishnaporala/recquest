import 'package:recquest_21/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:recquest_21/presentation/share_screen/controller/share_controller.dart';
import 'package:recquest_21/presentation/share_screen/share_screen.dart';

import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';

class UserItemWidgetState extends State<UserListWidget> {
  ShareController controller = Get.put(ShareController());
  List _selecteCategorys = [];
  var tmpArray = [];

  getSelectedUsers() {
    print(_selecteCategorys);
  }

  void _onCategorySelected(bool selected, user_id) {
    if (selected == true) {
      setState(() {
        tmpArray.add(user_id);
        controller.selectedUsers.add(user_id);
      });
    } else {
      setState(() {
        tmpArray.remove(user_id);
        controller.selectedUsers.remove(user_id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<MyProfileModel> userList = widget.userlist;

    return Column(children: <Widget>[
      Expanded(
          child: Column(
        children: [
          Expanded(
            child: ListView(children: <Widget>[
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CheckboxListTile(
                      value: tmpArray.contains(userList[index].id),
                      onChanged: (bool? selected) {
                        _onCategorySelected(selected!, userList[index].id);
                      },
                      title: Text(userList[index].firstname.toString()),
                    );
                  }),
            ]),
          ),
        ],
      ))
    ]);
  }
}
