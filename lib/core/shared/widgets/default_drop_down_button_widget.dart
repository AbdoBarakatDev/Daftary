import 'package:flutter/material.dart';

class DefaultDropDownButtonWidget extends StatelessWidget {
  final List<DropdownMenuItem<String>> dropList;
  final String? Function(dynamic val)? onChange;
  final double? height;
  final Color? dropDownButtonBorderColor;
  final bool? isDense;
  const DefaultDropDownButtonWidget(
      {Key? key,
      this.onChange,
      required this.dropList,
      this.dropDownButtonBorderColor,
      this.height,
      this.isDense})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: dropDownButtonBorderColor ?? Colors.grey)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
        value: dropList[0].value,
        isDense: isDense ?? false,
        isExpanded: true,
        items: dropList,
        onChanged: (newValue) {},
      )),
    );
  }
}
