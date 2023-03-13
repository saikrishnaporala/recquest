import 'package:recquest_21/presentation/mainhome_page/models/mainhome_item_model.dart';

import '../controller/search_events_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';

// ignore: must_be_immutable
class SearchEventsItemWidget extends StatelessWidget {
  MainhomeItemModel searchEventsItemModelObj;

  SearchEventsItemWidget(this.searchEventsItemModelObj);

  var controller = Get.find<SearchEventsController>();

  VoidCallback? onTapImgEllipseThirteen;

  VoidCallback? onTapTxtInternationalBand;

  VoidCallback? onTapTxtLanguage;

  VoidCallback? onTapTxtGroup662;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 15,
        right: 15,
      ),
      decoration: AppDecoration.outlineBlack90014.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: getSize(
              44.00,
            ),
            width: getSize(
              44.00,
            ),
            margin: getMargin(
              top: 67,
              bottom: 67,
            ),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgEllipse13,
                  height: getSize(
                    44.00,
                  ),
                  width: getSize(
                    44.00,
                  ),
                  radius: BorderRadius.circular(
                    getHorizontalSize(
                      22.00,
                    ),
                  ),
                  alignment: Alignment.center,
                  onTap: () {
                    onTapImgEllipseThirteen!();
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: getSize(
                      8.00,
                    ),
                    width: getSize(
                      8.00,
                    ),
                    margin: getMargin(
                      right: 4,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.green400,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          4.00,
                        ),
                      ),
                      border: Border.all(
                        color: ColorConstant.whiteA700,
                        width: getHorizontalSize(
                          2.00,
                        ),
                        // strokeAlign: StrokeAlign.outside,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    onTapTxtInternationalBand!();
                  },
                  child: Container(
                    width: getHorizontalSize(
                      136.00,
                    ),
                    child: Text("msg_international_band3".tr,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtNotoSansMedium16),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 1,
                  ),
                  child: Row(
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgLocationBlack90001,
                        height: getVerticalSize(
                          10.00,
                        ),
                        width: getHorizontalSize(
                          6.00,
                        ),
                        margin: getMargin(
                          top: 2,
                          bottom: 2,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          onTapTxtLanguage!();
                        },
                        child: Padding(
                          padding: getPadding(
                            left: 8,
                          ),
                          child: Text("msg_36_guild_street".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansMedium16),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onTapTxtGroup662!();
                  },
                  child: Container(
                    width: getHorizontalSize(
                      62.00,
                    ),
                    padding: getPadding(
                      left: 11,
                      top: 1,
                      right: 11,
                      bottom: 1,
                    ),
                    decoration: AppDecoration.txtFillAmber70026.copyWith(
                      borderRadius: BorderRadiusStyle.txtRoundedBorder10,
                    ),
                    child: Text("lbl_musical".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtNotoSansMedium16),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: getPadding(
              top: 69,
              right: 5,
              bottom: 69,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("lbl_02_dec2".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtNotoSansMedium16),
                Text("lbl_7_00pm".tr,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtNotoSansMedium16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
