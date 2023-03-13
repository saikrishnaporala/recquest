import 'dart:io' as io;
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/event_details_about_screen/models/PhotoItem.dart';
import 'package:recquest_21/presentation/my_profile_screen/models/my_profile_model.dart';
import 'package:recquest_21/presentation/pictures_screen/models/pictures_model.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:recquest_21/presentation/share_screen/models/share_model.dart';

class PicturesController extends GetxController {
  TextEditingController searchController = TextEditingController();

  Rx<PicturesModel> picturesModelObj = PicturesModel().obs;
  Rx<ShareModel> shareModelObj = ShareModel().obs;

  List<PhotoItem> photoList = Get.arguments[2]["imageList"];

  RxList items = [].obs;
  var selectedImages = [];
  late String directory;
  Rx<File> imageFile = File('').obs;
  List file = [].obs;
  var eventDir = Get.arguments[0]['folderPath'];
  PhotoItem? selectedCheckBoxValue;
  var isDataLoading = false.obs;

  // PicturesController(Rx<PicturesModel> obs);

  @override
  Future<void> onInit() async {
    super.onInit();
    await _listofFiles();
    // getAllReviews();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  onSelected(PhotoItem value) {
    selectedCheckBoxValue = value;
    picturesModelObj.value.photoItemList.forEach((element) {
      print(element.isSelected);
      // element.isSelected = false;
      if (element.name == selectedCheckBoxValue?.name) {
        element.isSelected = true;
      }
    });
    picturesModelObj.value.photoItemList.refresh();
    items.forEach((element) {
      print(element.isSelected);
      if (element.name == selectedCheckBoxValue?.name) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    });
    print(items.toJson());
  }

  Future<List<MyProfileModel>> getUsers() async {
    APIHandler apiClient = APIHandler();
    try {
      isDataLoading(true);
      dynamic response = await apiClient.get('/users', isAuthenticated: true);
      final List result = response.data;
      shareModelObj.value.usersList.value = List<MyProfileModel>.from(
          result.map((i) => MyProfileModel.fromJson(i))).toList();
      return shareModelObj.value.usersList;
    } catch (e) {
      log('Error while getting data is $e');
      print('Error while getting data is $e');
      throw Exception('Failed to load data');
    } finally {
      isDataLoading(false);
    }
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
      pi.isSelected = false;
      items.add(pi);
    }
    print(items.length);
  }

  Future<List<PhotoItem>> listofFiles() async {
    items.clear();
    picturesModelObj.value.photoItemList.clear();
    directory = (await getApplicationDocumentsDirectory()).path;
    file = io.Directory("$directory/$eventDir/")
        .listSync(); //use your folder name insted of resume.
    for (final e in file) {
      PhotoItem pi = new PhotoItem();
      pi.image = e.path;
      pi.name = basename(e.path);
      pi.isSelected = false;
      picturesModelObj.value.photoItemList.add(pi);
    }
    return picturesModelObj.value.photoItemList.toList();
  }
}
