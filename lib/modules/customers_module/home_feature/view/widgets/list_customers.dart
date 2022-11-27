import 'package:daftary_app/core/shared/widgets/list_builder_widget.dart';
import 'package:flutter/material.dart';

class CustomUsersList extends StatelessWidget {
  const CustomUsersList({Key? key, required this.listUserType})
      : super(key: key);
  final List listUserType;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
            height: double.infinity,
            child: ListBuilderWidget(
              listUserType: listUserType,
            )));
  }
}
