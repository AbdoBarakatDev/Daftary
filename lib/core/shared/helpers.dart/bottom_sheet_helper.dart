import 'package:flutter/material.dart';

class BottomSheetHelper {
  static showModalBottomSheetMenu(
      {required BuildContext context, required Widget content}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40.0))),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: content,
        );
      },
    );
  }
}
