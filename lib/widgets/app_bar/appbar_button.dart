import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';
import 'package:recquest_21/widgets/custom_button.dart';

// ignore: must_be_immutable
class AppbarButton extends StatelessWidget {
  AppbarButton({this.margin, this.onTap});

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomButton(
          height: 32,
          width: 77,
          text: "lbl_filters".tr,
          shape: ButtonShape.RoundedBorder4,
          padding: ButtonPadding.PaddingT6,
          fontStyle: ButtonFontStyle.NotoSansRegular12,
          prefixWidget: Container(
            margin: getMargin(
              right: 4,
            ),
            child: CustomImageView(
              svgPath: ImageConstant.imgFilter,
            ),
          ),
        ),
      ),
    );
  }
}
