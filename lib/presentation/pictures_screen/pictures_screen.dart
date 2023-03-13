import 'dart:collection';
import 'dart:io';
import 'package:dio/dio.dart' as diohttp;
import 'package:image_picker/image_picker.dart';
import 'package:recquest_21/api/api_handler.dart';
import 'package:recquest_21/presentation/event_details_about_screen/models/PhotoItem.dart';
import 'package:recquest_21/presentation/pictures_screen/widgets/pictures_item_widget.dart';
import 'package:recquest_21/widgets/app_bar/appbar_image.dart';
import 'package:recquest_21/widgets/app_bar/appbar_subtitle.dart';

import 'controller/pictures_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/widgets/app_bar/custom_app_bar.dart';

// ignore: must_be_immutable
class PicturesScreen extends GetWidget<PicturesController> {
  // PicturesController controller =
  //     Get.put(PicturesController(PicturesModel().obs));
  dynamic argData = Get.arguments;

  final ImagePicker imgpicker = ImagePicker();
  List<XFile>? imagefiles;

  HashSet selectItems = new HashSet();
  bool isMultiSelectionEnabled = false;

  @override
  Widget build(BuildContext context) {
    // Future<List<PhotoItem>> files = controller.listofFiles();

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray10001,
        appBar: CustomAppBar(
            height: getVerticalSize(50.00),
            leadingWidth: 32,
            leading: AppbarImage(
                height: getSize(16.00),
                width: getSize(16.00),
                svgPath: ImageConstant.imgArrowleft,
                margin: getMargin(left: 16, top: 15, bottom: 15),
                onTap: onTapArrowleft),
            title: AppbarSubtitle(
                text: argData[1]["title"] + " Images",
                margin: getMargin(left: 16)),
            actions: [
              GestureDetector(
                onTap: () {
                  onTapShareImages();
                },
                child: Container(
                  width: 44,
                  height: 44,
                  margin: getMargin(
                    right: 5,
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Icon(
                    Icons.share,
                    color: ColorConstant.pink800,
                  ),
                ),
              ),
            ],
            styleType: Style.bgFillWhiteA700),
        body: Container(
            width: size.width,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                child: Container(
                  child: ImagesListWidget(imageslist: argData[2]["imageList"]),
                ),
              )
            ])),
      ),
    );
  }

  String getSelectedItemCount() {
    return selectItems.isNotEmpty
        ? selectItems.length.toString() + " item selected"
        : "No item selected";
  }

  void doMultiSelection(String path) {
    if (isMultiSelectionEnabled) {
      // setState(() {
      if (selectItems.contains(path)) {
        selectItems.remove(path);
      } else {
        selectItems.add(path);
      }
      // });
    } else {
      //
    }
  }

  onTapArrowleft() {
    Get.back();
  }

  Future<void> onTapShareImages() async {
    Map<String, dynamic> fileMap = {};
    controller.photoList.forEach((element) async {
      if (element.isSelected == true) {
        fileMap[element.name ?? ""] = diohttp.MultipartFile.fromFile(
            element.image ?? "",
            filename: element.name);
      }
      print(fileMap);
    });
    fileMap['title'] = argData[1]['title'];
    fileMap['event_id'] = argData[3]['event_id'];
    try {
      APIHandler apiClient = APIHandler();

      diohttp.FormData formData = new diohttp.FormData.fromMap(fileMap);
      dynamic response = await apiClient.postFiles('/savePicture',
          data: formData, isAuthenticated: true);

      dynamic resondeData = response.data;
      print(resondeData);
      Get.snackbar(
        'Success',
        resondeData['message'],
        backgroundColor: Colors.pink[900],
      );
    } catch (onError) {
      print(onError);
      Get.snackbar('Error', onError.toString());
    }
  }

  openImages() async {
    try {
      var pickedfiles = await imgpicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedfiles != null) {
        imagefiles = pickedfiles;
        // setState(() {});
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  GridTile getGridItem(String path) {
    return GridTile(
      child: InkWell(
        onTap: () {
          doMultiSelection(path);
        },
        onLongPress: () {
          isMultiSelectionEnabled = true;
          doMultiSelection(path);
        },
        child: Stack(
          children: [
            Image.file(
              File(path),
              color:
                  Colors.black.withOpacity(selectItems.contains(path) ? 1 : 0),
              colorBlendMode: BlendMode.color,
            ),
            // Image.network(
            //   path,
            //   color:
            //       Colors.black.withOpacity(selectItems.contains(path) ? 1 : 0),
            //   colorBlendMode: BlendMode.color,
            // ),
            Visibility(
                visible: selectItems.contains(path),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 30,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class ImagesListWidget extends StatefulWidget {
  ImagesListWidget({Key? key, required this.imageslist}) : super(key: key);
  final List<PhotoItem> imageslist;

  @override
  PictureItemWidgetState createState() => new PictureItemWidgetState();
}
