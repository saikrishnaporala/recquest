import 'package:get/get.dart';
import 'package:recquest_21/data/models/selectionPopupModel/selection_popup_model.dart';
import 'package:flutter/material.dart';

class CreateEventsModel {
  // RxList<SelectionPopupModel> categoryList = RxList([]);
  RxList<SelectionPopupModel> categoryList = [
    SelectionPopupModel(
      id: 1,
      title: "Sports",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Music",
    )
  ].obs;
  TimeOfDay selectedEventDateTimeOneTxt = TimeOfDay.now();

  Rx<String> eventDateTimeOneTxt = Rx("msg_event_date_time".tr);
}
