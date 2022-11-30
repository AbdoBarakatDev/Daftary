import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomContainerWidget extends StatelessWidget {
  const CustomContainerWidget(
      {Key? key,
      this.height,
      this.alignment,
      this.clipBehavior,
      this.decoration,
      required this.text,
      this.width,
      required this.isActive})
      : super(key: key);
  final double? height;
  final double? width;
  final AlignmentGeometry? alignment;
  final Clip? clipBehavior;
  final Decoration? decoration;
  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        height: height ?? 55,
        width: width,
        alignment: alignment ?? Alignment.center,
        clipBehavior: clipBehavior ?? Clip.antiAliasWithSaveLayer,
        decoration: decoration ??
            BoxDecoration(
                color: isActive
                    ? activeMaterialButtonColor
                    : inActiveMaterialButtonColor,
                borderRadius: BorderRadius.circular(10)),
        child: Text(
          text,
          style: TextStyle(
              color: isActive
                  ? activeMaterialButtonTextColor
                  : inActiveMaterialButtonTextColor),
        ));
  }
}
