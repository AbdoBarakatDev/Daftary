import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class DefaultMaterialButton extends StatelessWidget {
  final Color? buttonColor;
  final double? height;
  final bool? isEnabled;
  final double? width;
  final String text;

  final Color? inActiveTextColor;
  final BoxBorder? buttonBorder;
  final Color? activeButtonColor;
  final Color? inActiveButtonColor;
  final Color? textColor;
  final void Function() function;
  final TextStyle? textStyle;
  final bool? isSelected;
  final double? radius;
  final double? fontSize;
  const DefaultMaterialButton(
      {Key? key,
      this.buttonColor,
      this.width,
      required this.function,
      required this.text,
      this.radius,
      this.height,
      this.textStyle,
      this.textColor,
      this.isSelected,
      this.fontSize,
      this.isEnabled,
      this.inActiveTextColor,
      this.activeButtonColor,
      this.inActiveButtonColor,
      this.buttonBorder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 55,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 10),
        border: buttonBorder,
        color: buttonColor ??
            (isSelected == true
                ? (activeButtonColor) ?? defaultButtonColor
                : (inActiveButtonColor) ?? inActiveMaterialButtonColor),
      ),
      child: MaterialButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // enableFeedback: isEnabled!,
        onPressed: function,
        child: Text(
          text,
          style: textStyle ??
              (isSelected == true
                  ? TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: textColor ?? defaultAppColor)
                  : TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: inActiveTextColor ?? Colors.grey.shade400)),
        ),
      ),
    );
  }
}
