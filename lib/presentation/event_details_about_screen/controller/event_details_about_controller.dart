import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/event_details_about_screen/models/EventReviewItemModel.dart';
import 'package:recquest_21/presentation/event_details_about_screen/models/PhotoItem.dart';
import 'package:recquest_21/presentation/event_details_about_screen/models/ReviewItem.dart';
import 'package:recquest_21/presentation/event_details_about_screen/models/event_details_about_model.dart';
import 'package:recquest_21/presentation/following_screen/models/following_item_model.dart';
import 'package:recquest_21/presentation/following_screen/models/following_model.dart';

class EventDetailsAboutController extends GetxController {
  TextEditingController reviewMessage = TextEditingController();
  TextEditingController rating = TextEditingController();

  Rx<ReviewItem> eventReviewModelObj = ReviewItem().obs;

  Rx<FollowingModel> eventFollowingModelObj = FollowingModel().obs;

  Rx<EventDetailsAboutModel> eventDetailsAboutModelObj =
      EventDetailsAboutModel().obs;

  List<FollowingItemModel> followingItems = <FollowingItemModel>[].obs;

  RxList items = [].obs;

  Rx<File> imageFile = File('').obs;
  List file = [].obs;
  var eventDir = Get.arguments.slug;
  var isDataLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await _listofFiles();
  }

  late String directory;
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  dynamic getFileName(String path) {
    return basename(path);
  }

// Make New Function
  _listofFiles() async {
    items.clear();
    directory = (await getApplicationDocumentsDirectory()).path;
    file = io.Directory("$directory/$eventDir/")
        .listSync(); //use your folder name insted of resume.
    for (final e in file) {
      PhotoItem pi = new PhotoItem();
      pi.image = e.path;
      pi.name = basename(e.path);
      items.add(pi);
    }
    print(items.length);
  }

  Future<List<PhotoItem>> listofFiles() async {
    directory = (await getApplicationDocumentsDirectory()).path;
    file = io.Directory("$directory/$eventDir/")
        .listSync(); //use your folder name insted of resume.
    eventDetailsAboutModelObj.value.photoItemList.clear();
    for (final e in file) {
      PhotoItem pi = new PhotoItem();
      pi.image = e.path;
      pi.name = basename(e.path);
      eventDetailsAboutModelObj.value.photoItemList.add(pi);
    }
    return eventDetailsAboutModelObj.value.photoItemList.toList();
  }

  getAllReviews() async {
    APIHandler apiClient = APIHandler();

    try {
      isDataLoading(true);
      dynamic reviewDataObj = {
        "event_id": Get.arguments.id,
      };

      dynamic response = await apiClient.post('/getReviewsByEvent',
          data: reviewDataObj, isAuthenticated: true);

      final List result = json.decode(response.data);

      List<EventReviewItemModel> list = List<EventReviewItemModel>.from(
          result.map((i) => EventReviewItemModel.fromJson(i)));

      eventReviewModelObj.value.eventReviewItemList.clear();
      eventReviewModelObj.value.eventReviewItemList.value = list;
      eventReviewModelObj.value.eventReviewItemList
          .forEach((element) => print(element.reviewmessage));
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
      throw Exception('Failed to load data');
    } finally {
      isDataLoading(false);
    }
  }

}
