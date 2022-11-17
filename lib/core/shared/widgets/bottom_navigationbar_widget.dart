import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final void Function(int? int)? onTab;
  final List<BottomNavigationBarItem> bottomNavBarItems;
  const BottomNavigationBarWidget(
      {Key? key,
      required this.currentIndex,
      this.onTab,
      required this.bottomNavBarItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: onTab, currentIndex: currentIndex, items: bottomNavBarItems);
  }
}
