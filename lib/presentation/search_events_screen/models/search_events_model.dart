import 'package:get/get.dart';
import 'package:recquest_21/presentation/mainhome_page/models/mainhome_item_model.dart';

class SearchEventsModel {
  RxList<MainhomeItemModel> searchEventsItemList =
      RxList.filled(0, MainhomeItemModel());
}
