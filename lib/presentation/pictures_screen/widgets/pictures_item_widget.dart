import 'dart:io';

import 'package:recquest_21/presentation/event_details_about_screen/models/PhotoItem.dart';
import 'package:recquest_21/presentation/pictures_screen/controller/pictures_controller.dart';
import 'package:recquest_21/presentation/pictures_screen/pictures_screen.dart';

import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';

class PictureItemWidgetState extends State<ImagesListWidget> {
  PicturesController controller = Get.put(PicturesController());

  void _onCategorySelected(bool selected, img_id) {
    if (selected == true) {
      setState(() {
        controller.photoList.forEach((element) {
          if (element.name == img_id) {
            element.isSelected = true;
          }
        });
        controller.selectedImages.add(img_id);
      });
    } else {
      setState(() {
        controller.photoList.forEach((element) {
          if (element.name == img_id) {
            element.isSelected = false;
          }
        });
        controller.selectedImages.remove(img_id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<PhotoItem> imagesList = widget.imageslist;

    return Column(children: <Widget>[
      Expanded(
          child: Column(
        children: [
          Expanded(
            child: ListView(children: <Widget>[
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    crossAxisCount: 2,
                  ),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: imagesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.all(20.0),
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(
                              File(imagesList[index].image.toString())),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: CheckboxListTile(
                        value: controller.selectedImages
                            .contains(imagesList[index].name),
                        onChanged: (bool? selected) {
                          _onCategorySelected(
                              selected!, imagesList[index].name);
                        },
                        activeColor: ColorConstant.pink300,
                        checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    );
                    // return CheckboxListTile(
                    //   value: controller.selectedImages
                    //       .contains(imagesList[index].name),
                    //   title: Container(
                    //     height: 250,
                    //     // width: 50,
                    //     child: Image.file(
                    //         File(imagesList[index].image.toString())),
                    //   ),
                    //   onChanged: (bool? selected) {
                    //     _onCategorySelected(selected!, imagesList[index].name);
                    //   },
                    //   activeColor: ColorConstant.pink300,
                    //   checkboxShape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(15)),
                    //   controlAffinity: ListTileControlAffinity.leading,
                    // );
                  }),
            ]),
          ),
          Expanded(child: Container())
        ],
      ))
    ]);
  }
}
