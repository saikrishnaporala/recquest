import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/presentation/event_details_about_screen/models/PhotoItem.dart';

// ignore: must_be_immutable
class FlashsaleItemWidget extends StatelessWidget {
  final String folderPath;
  // FlashsaleItemWidget({required this.folderPath, this.filesList});
  const FlashsaleItemWidget(
      {Key? key, required this.folderPath, required this.filesList})
      : super(key: key);
  final Future<List<PhotoItem>> filesList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: filesList,
      builder: (BuildContext context, AsyncSnapshot<List<PhotoItem>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<PhotoItem> files = snapshot.data ?? [];
          var size = MediaQuery.of(context).size;

          /*24 is for notification bar on Android*/

          if (files.length > 0) {
            return GridView.builder(
              itemCount: files.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                String imgPath_temp = files[index].image ?? 'default';
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => RouteTwo(
                    //         image: files[index].image, name: files[index].name),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin:
                        EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 0),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(File(imgPath_temp)),
                      ),
                    ),
                  ),
                );
                // GestureDetector(
                //   onTap: () {
                //     onTapProduct(files[index].image);
                //   },
                //   child: Container(
                //     margin: getMargin(
                //       right: 16,
                //       top: 16,
                //     ),
                //     padding: getPadding(
                //       all: 5,
                //     ),
                //     alignment: Alignment.center,
                //     decoration: BoxDecoration(
                //         color: Colors.amber,
                //         borderRadius: BorderRadius.circular(15)),
                //     child: CustomImageView(
                //       file: File(files[index].image),
                //       height: getSize(
                //         100,
                //       ),
                //       width: getSize(
                //         100,
                //       ),
                //       radius: BorderRadius.circular(
                //         getHorizontalSize(
                //           5,
                //         ),
                //       ),
                //     ),
                //   ),
                // );
              },
            );
          } else {
            return Container(
                width: size.width,
                // padding: getPadding(left: 37, right: 37),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: getPadding(top: 33),
                          child: Text("No images found for the event",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansRegular12)),
                    ]));
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void onTapProduct(String image) {
    print(image);
  }

  // PhotoItem photoItemModelObj;

  // var controller = Get.find<EventDetailsAboutController>();

  // VoidCallback? onTapProduct;

  // @override
  // Widget build(BuildContext context) {
  //   return IntrinsicWidth(
  //     child: Align(
  //       alignment: Alignment.topLeft,
  //       child: GestureDetector(
  //         onTap: () {
  //           onTapProduct!();
  //         },
  //         child: Container(
  //           margin: getMargin(
  //             right: 16,
  //             top: 16,
  //           ),
  //           padding: getPadding(
  //             all: 16,
  //           ),
  //           decoration: AppDecoration.outlineBlue501.copyWith(
  //             borderRadius: BorderRadiusStyle.roundedBorder5,
  //           ),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               CustomImageView(
  //                 file: File(photoItemModelObj.image),
  //                 height: getSize(
  //                   109,
  //                 ),
  //                 width: getSize(
  //                   109,
  //                 ),
  //                 radius: BorderRadius.circular(
  //                   getHorizontalSize(
  //                     5,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
