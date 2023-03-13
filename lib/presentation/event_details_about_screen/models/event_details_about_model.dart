import 'package:get/get.dart';
import 'package:recquest_21/presentation/event_details_about_screen/models/PhotoItem.dart';
import 'listcalendar_item_model.dart';

class EventDetailsAboutModel {
  RxList<ListcalendarItemModel> listcalendarItemList =
      RxList.filled(2, ListcalendarItemModel());

  RxList<PhotoItem> photoItemList = RxList.generate(0, (index) => PhotoItem());
}
