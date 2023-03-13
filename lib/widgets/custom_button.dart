import 'package:flutter/material.dart';
import 'package:recquest_21/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        getHorizontalSize(width ?? 0),
        getVerticalSize(height ?? 0),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      side: _setTextButtonBorder(),
      shadowColor: _setTextButtonShadowColor(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll9:
        return getPadding(
          all: 9,
        );
      case ButtonPadding.PaddingAll14:
        return getPadding(
          all: 14,
        );
      case ButtonPadding.PaddingT6:
        return getPadding(
          top: 6,
          right: 6,
          bottom: 6,
        );
      case ButtonPadding.PaddingT9:
        return getPadding(
          top: 9,
          right: 9,
          bottom: 9,
        );
      default:
        return getPadding(
          all: 4,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.OutlineGray300:
        return ColorConstant.gray10002;
      case ButtonVariant.OutlineBlack90007:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineCyan30014_1:
        return ColorConstant.pink80001;
      case ButtonVariant.OutlineCyan30014:
        return ColorConstant.whiteA70065;
      case ButtonVariant.OutlineCyan30014_1:
        return ColorConstant.pink80001;
      case ButtonVariant.OutlineBlack90019:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineGray30001:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineCyan30014_2:
        return ColorConstant.indigoA20063;
      case ButtonVariant.OutlineWhiteA700:
        return ColorConstant.pink80001;
      default:
        return ColorConstant.pink80001;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineGray300:
        return BorderSide(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineGray30001:
        return BorderSide(
          color: ColorConstant.gray30001,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineWhiteA700:
        return BorderSide(
          color: ColorConstant.whiteA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      default:
        return null;
        ;
    }
  }

  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariant.OutlineBlack90007:
        return ColorConstant.black90007;
      case ButtonVariant.OutlineCyan30014_1:
        return ColorConstant.cyan30014;
      case ButtonVariant.OutlineCyan30014:
        return ColorConstant.cyan30014;
      case ButtonVariant.OutlineCyan30014_1:
        return ColorConstant.cyan30014;
      case ButtonVariant.OutlineBlack90019:
        return ColorConstant.black90019;
      case ButtonVariant.OutlineCyan30014_2:
        return ColorConstant.cyan30014;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder14:
        return BorderRadius.circular(
          getHorizontalSize(
            14.00,
          ),
        );
      case ButtonShape.RoundedBorder4:
        return BorderRadius.circular(
          getHorizontalSize(
            4.00,
          ),
        );
      case ButtonShape.RoundedBorder7:
        return BorderRadius.circular(
          getHorizontalSize(
            7.00,
          ),
        );
      case ButtonShape.RoundedBorder17:
        return BorderRadius.circular(
          getHorizontalSize(
            17.00,
          ),
        );
      case ButtonShape.RoundedBorder10:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              4.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              4.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.NotoSansRegular14:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Noto Sans',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.NotoSansBold16:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Noto Sans',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.NotoSansRegular14Bluegray300:
        return TextStyle(
          color: ColorConstant.blueGray300,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Noto Sans',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.NotoSansBold14:
        return TextStyle(
          color: ColorConstant.blueGray300,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Noto Sans',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.NotoSansRegular12:
        return TextStyle(
          color: ColorConstant.deepPurple50,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Noto Sans',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.NotoSansSemiBold12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Noto Sans',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.MontserratRomanSemiBold12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.NotoSansBold15:
        return TextStyle(
          color: ColorConstant.pink80001,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Noto Sans',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.NotoSansSemiBold18:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Noto Sans',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.NotoSansBold16Gray90001:
        return TextStyle(
          color: ColorConstant.gray90001,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Noto Sans',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.NotoSansBoldItalic10:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            10,
          ),
          fontFamily: 'Noto Sans',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.NotoSansSemiBold16:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Noto Sans',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.NotoSansRegular14Black900cc:
        return TextStyle(
          color: ColorConstant.black900Cc,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Noto Sans',
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Noto Sans',
          fontWeight: FontWeight.w600,
        );
    }
  }
}

enum ButtonShape {
  Square,
  CustomBorderTL4,
  RoundedBorder14,
  RoundedBorder4,
  RoundedBorder7,
  RoundedBorder17,
  RoundedBorder10,
}

enum ButtonPadding {
  PaddingAll4,
  PaddingAll9,
  PaddingAll14,
  PaddingT6,
  PaddingT9,
}

enum ButtonVariant {
  OutlineGray300,
  FillPink80001,
  OutlineBlack90007,
  OutlineCyan30014,
  OutlineCyan30014_1,
  OutlineBlack90019,
  OutlineGray30001,
  OutlineCyan30014_2,
  OutlineWhiteA700,
}

enum ButtonFontStyle {
  NotoSansRegular14,
  NotoSansBold16,
  NotoSansRegular14Bluegray300,
  NotoSansBold14,
  NotoSansRegular12,
  NotoSansSemiBold12,
  MontserratRomanSemiBold12,
  NotoSansBold15,
  NotoSansSemiBold18,
  NotoSansBold16Gray90001,
  NotoSansBoldItalic10,
  NotoSansSemiBold16,
  NotoSansRegular14Black900cc,
  txtNotoSansMedium16W,
}
