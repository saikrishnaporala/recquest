import 'package:basic_utils/basic_utils.dart';
import 'package:intl/intl.dart';
import 'package:recquest_21/presentation/mainhome_page/models/mainhome_item_model.dart';
import 'package:recquest_21/presentation/organizer_profile_about_screen/controller/organizer_profile_about_controller.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';

// ignore: must_be_immutable
class ListEventItemWidget extends StatelessWidget {
  ListEventItemWidget(this.orgeventModel);

  MainhomeItemModel orgeventModel;

  var controller = Get.find<OrganizerProfileAboutController>();

  VoidCallback? onTapTxtInternationalBand;

  VoidCallback? onTapTxtLanguage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: getPadding(
          left: 15,
          top: 15,
          right: 15,
          bottom: 15,
        ),
        decoration: AppDecoration.outlineBlack90014.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                    child: Text(orgeventModel.title.toString(),
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
                          child: Text(
                              StringUtils.capitalize(
                                  orgeventModel.venue.toString()),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtNotoSansMedium16),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
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
                  child: Text(
                      StringUtils.capitalize(
                          orgeventModel.categoryName.toString()),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtNotoSansMedium16),
                ),
              ],
            ),
            Padding(
              padding: getPadding(
                top: 10,
                right: 1,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      DateFormat.yMMMd().format(
                          DateTime.parse(orgeventModel.date.toString())),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtNotoSansMedium16),
                  Text(
                      DateFormat.jm().format(
                          DateTime.parse(orgeventModel.date.toString())),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtNotoSansMedium16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
