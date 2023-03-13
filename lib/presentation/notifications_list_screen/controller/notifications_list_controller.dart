import 'dart:convert';
import 'dart:developer';

import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/notifications_list_screen/models/NotificationItem.dart';
import 'package:recquest_21/presentation/notifications_list_screen/models/notifications_model.dart';
import 'package:recquest_21/utils/background_controller.dart';

class NotificationsListController extends GetxController {
  Rx<NotificationItem> notificationsListModelObj = NotificationItem().obs;

  var isDataLoading = false.obs;
  @override
  Future<void> onInit() async {
    notificationsListModelObj.value.notificationItemList.clear();
    super.onInit();
    getAllNotifications();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getAllNotifications() async {
    APIHandler apiClient = APIHandler();
    print(BackgroundController.instance.uid);
    try {
      isDataLoading(true);

      dynamic response = await apiClient.get('/getNotifications',
          isAuthenticated: true);

      final List result = json.decode(response.data);

      List<NotificationsModel> list = List<NotificationsModel>.from(
          result.map((i) => NotificationsModel.fromJson(i)));

      notificationsListModelObj.value.notificationItemList.value = list;
      notificationsListModelObj.value.notificationItemList
          .forEach((element) => print(element.eventId));
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
      throw Exception('Failed to load data');
    } finally {
      isDataLoading(false);
    }
  }
}
