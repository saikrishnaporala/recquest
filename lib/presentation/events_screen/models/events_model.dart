import 'package:get/get.dart';
import 'package:recquest_21/presentation/mainhome_page/models/mainhome_item_model.dart';

class EventsModel {
  RxList<MainhomeItemModel> eventsItemList =
      RxList.filled(0, MainhomeItemModel());
}
