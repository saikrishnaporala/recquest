import 'package:get/get.dart';
import 'package:recquest_21/presentation/event_details_about_screen/models/EventReviewItemModel.dart';
import 'package:recquest_21/presentation/following_screen/models/following_item_model.dart';

class ReviewItem {
  RxList<EventReviewItemModel> eventReviewItemList =
      RxList.filled(0, EventReviewItemModel());
}
