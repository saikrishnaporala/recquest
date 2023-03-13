import 'package:get/get.dart';
import 'package:recquest_21/presentation/mainhome_page/models/mainhome_item_model.dart';
import 'package:recquest_21/presentation/organizer_profile_about_screen/models/review_item_model.dart';

class OrganizerProfileAboutModel {
  RxList<MainhomeItemModel> mainhomeItemList =
      RxList.filled(0, MainhomeItemModel());

  RxList<ReviewItemModel> reviewItemList = RxList.filled(3, ReviewItemModel());
}
