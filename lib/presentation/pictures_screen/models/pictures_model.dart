import 'package:get/get.dart';
import 'package:recquest_21/presentation/event_details_about_screen/models/PhotoItem.dart';
import 'pictures_item_model.dart';

class PicturesModel {
  RxList<PhotoItem> photoItemList = RxList.generate(0, (index) => PhotoItem());
}
