import '../controller/event_details_about_controller.dart';
import '../models/listcalendar_item_model.dart';
import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ListcalendarItemWidget extends StatelessWidget {
  ListcalendarItemWidget(this.listcalendarItemModelObj);

  ListcalendarItemModel listcalendarItemModelObj;

  var controller = Get.find<EventDetailsAboutController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          height: 35,
          width: 35,
          variant: IconButtonVariant.FillIndigoA20063,
          shape: IconButtonShape.RoundedBorder12,
          child: CustomImageView(
            svgPath: ImageConstant.imgCalendarIndigoA200,
          ),
        ),
        Padding(
          padding: getPadding(
            left: 10,
            top: 2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "msg_tue_dec_08_2022".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtNotoSansMedium16.copyWith(
                  height: getVerticalSize(
                    0.91,
                  ),
                ),
              ),
              Text(
                "lbl_4_00pm_9_00pm".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtNotoSansMedium16.copyWith(
                  height: getVerticalSize(
                    1.00,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
