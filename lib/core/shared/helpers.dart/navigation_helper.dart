import 'package:flutter/material.dart';

class NavigationHelper {
  static doNamedNavigation(BuildContext context, String routeName) =>
      Navigator.pushNamed(context, routeName);

  static doWidgetNavigation(BuildContext context, Widget screen) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));

  static doReplacementWidgetNavigation(BuildContext context, Widget screen) =>
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => screen));
}
