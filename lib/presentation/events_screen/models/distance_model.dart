import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DistanceModel {
  RxList<DropdownMenuItem> distanceList = [
    DropdownMenuItem(
      child: Text("5 Miles"),
      value: 1,
    ),
    DropdownMenuItem(
      child: Text("10 Miles"),
      value: 2,
    ),
    DropdownMenuItem(
      child: Text("15 Miles"),
      value: 3,
    ),
    DropdownMenuItem(
      child: Text("20 Miles"),
      value: 4,
    ),
    DropdownMenuItem(
      child: Text("25 Miles"),
      value: 5,
    ),
  ].obs;
  TimeOfDay selectedEventDateTimeOneTxt = TimeOfDay.now();

  Rx<String> eventDateTimeOneTxt = Rx("msg_event_date_time".tr);
}
