import 'dart:developer';

import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/custom_divider_widget.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/custom_row_widget.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          CustomRowWidget(
            function: () {
              log("Business Name clicked.");
            },
            prefixIcon: Icons.store,
            settingsName: "Business Name",
            settingsValue: "Online Boody Store",
            suffix: CircleAvatar(
              backgroundColor: defaultAppColor.withOpacity(0.1),
              radius: 20,
              child: const Icon(
                Icons.edit,
                color: defaultAppColor,
              ),
            ),
          ),
          const CustomDividerWidget(),
          CustomRowWidget(
            function: () {
              log("Mobile number clicked.");
            },
            prefixIcon: Icons.phone,
            settingsName: "Mobile number",
            settingsValue: "01027178857",
          ),
          const CustomDividerWidget(),
          CustomRowWidget(
            function: () {
              log("PIN Code clicked.");
            },
            prefixIcon: Icons.lock_open_outlined,
            settingsName: "PIN Code",
          ),
          const CustomDividerWidget(),
          CustomRowWidget(
            function: () {
              log("Backup Information clicked.");
            },
            prefixIcon: Icons.settings_backup_restore_outlined,
            settingsName: "Backup Information",
          ),
          const CustomDividerWidget(),
          CustomRowWidget(
            function: () {
              log("Change Language clicked.");
            },
            prefixIcon: Icons.language_outlined,
            settingsName: "Change Language",
            settingsValue: "English",
          ),
          const CustomDividerWidget(),
          CustomRowWidget(
            function: () {
              log("Log out clicked.");
            },
            prefixIcon: Icons.logout,
            settingsName: "Log out",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Need Help, Ask us",
                  style: TextStyle(fontFamily: "Raleway"),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.support_agent_sharp,
                    size: 40,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
