import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:daftary_app/core/shared/widgets/default_material_button.dart';
import 'package:flutter/material.dart';

class AlertMenuHelper {
  static void showAlertDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select your Language"),
          actionsAlignment: MainAxisAlignment.spaceAround,
          actions: <Widget>[
            DefaultMaterialButton(
              text: "English",
              textStyle: TextStyle(color: mainBackgroundColor),
              buttonBorder: Border.all(color: mainBackgroundColor),
              function: () {
                Navigator.of(context).pop();
              },
            ),
            DefaultMaterialButton(
              text: "العربية",
              textStyle: TextStyle(color: mainBackgroundColor),
              buttonBorder: Border.all(color: mainBackgroundColor),
              function: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
