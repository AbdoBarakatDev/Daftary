import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomRowWidget extends StatelessWidget {
  const CustomRowWidget(
      {Key? key,
      required this.prefixIcon,
      required this.settingsName,
      this.settingsValue,
      this.suffix,
      required this.function})
      : super(key: key);
  final void Function() function;
  final IconData prefixIcon;
  final String settingsName;
  final String? settingsValue;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: SizedBox(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                prefixIcon,
                color: defaultAppColor,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(settingsName),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(settingsValue ?? "",
                      style: TextStyle(color: Colors.grey),
                      overflow: TextOverflow.ellipsis)),
              const Spacer(),
              suffix ??
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade500,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
