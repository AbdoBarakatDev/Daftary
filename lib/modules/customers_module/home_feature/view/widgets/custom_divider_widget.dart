import 'package:flutter/material.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget(
      {Key? key, this.color, this.endIndent, this.indent, this.height})
      : super(key: key);
  final Color? color;
  final double? endIndent;
  final double? indent;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? Colors.grey.shade400,
      endIndent: endIndent ?? 2,
      indent: indent ?? 2,
      height: height ?? 2,
    );
  }
}
