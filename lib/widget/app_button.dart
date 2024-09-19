import 'package:flutter/material.dart';
import '../utils/appcolor.dart';
import 'text_view.dart';


class AppElevatedButton extends StatelessWidget {
  String? title;
  Widget? child;
  Color? color;
  double? height;
  double? width;
  BoxConstraints? constraints;
  double borderRadius;
  Color? titleColor;
  double titleSize;
  FontWeight? titleFontWeight;
  int titleMaxLines;
  TextAlign titleAlign;
  double elevation;
  VoidCallback? onPressed;
  BorderSide? borderSide;
  EdgeInsets? contentPadding;
  double fontSize;

  AppElevatedButton({
    super.key,
    this.title,
    this.child,
    this.color,
    this.height = 50,
    this.width,
    this.constraints,
    this.borderRadius = 8,
    this.titleColor,
    this.titleSize = 16,
    this.titleFontWeight,
    this.titleMaxLines = 1,
    this.titleAlign = TextAlign.center,
    this.elevation = 1.0,
    this.onPressed,
    this.borderSide,
    this.contentPadding,
    this.fontSize = 16,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      constraints: constraints,
      decoration: BoxDecoration(
        gradient: AppColors.horizontalLinear,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation:  elevation,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            side:
            BorderSide.none,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: title != null
            ? Padding(
                padding: contentPadding ?? EdgeInsets.zero,
                child: FittedBox(
                  child: TextView(
                    title!,
                    fontSize: fontSize,
                    textColor: Colors.white,
                    fontWeight: titleFontWeight ?? FontWeight.w400,
                  ),
                ),
              )
            : child,
      ),
    );
  }
}
