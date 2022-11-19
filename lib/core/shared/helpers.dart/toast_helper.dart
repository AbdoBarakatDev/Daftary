import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  static showToast({
    BuildContext? context,
    required String? message,
    Toast time = Toast.LENGTH_SHORT,
    MaterialColor color = Colors.green,
    Color textColor = Colors.white,
    double fontSize = 16.0,
    ToastGravity gravity = ToastGravity.BOTTOM,
  }) {
    Fluttertoast.showToast(
        msg: message!,
        toastLength: time,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: textColor,
        fontSize: fontSize);
  }
}
