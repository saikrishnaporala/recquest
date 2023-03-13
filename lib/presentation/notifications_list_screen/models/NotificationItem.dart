import 'package:get/get.dart';
import 'package:recquest_21/presentation/notifications_list_screen/models/notifications_model.dart';

class NotificationItem {
  RxList<NotificationsModel> notificationItemList =
      RxList.filled(0, NotificationsModel());
}
