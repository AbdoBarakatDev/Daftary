import 'dart:developer';

import 'package:daftary_app/core/shared/helpers.dart/alert_menu_helper.dart';
import 'package:daftary_app/core/shared/helpers.dart/bottom_sheet_helper.dart';
import 'package:daftary_app/core/shared/helpers.dart/navigation_helper.dart';
import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/custom_divider_widget.dart';
import 'package:daftary_app/modules/customers_module/more_feateurs/view/screens/change_phone_number_screen.dart';
import 'package:daftary_app/modules/customers_module/more_feateurs/view/widgets/custom_row_widget.dart';
import 'package:daftary_app/modules/customers_module/more_feateurs/view/screens/enable_pincode_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared/widgets/default_material_button.dart';
import '../../../../../core/shared/widgets/default_text_form_field.dart';

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
              BottomSheetHelper.showModalBottomSheetMenu(
                  context: context,
                  content: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      height: MediaQuery.of(context).size.height * 0.25,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 3,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: mainBackgroundColor,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(50.0),
                                        topRight: Radius.circular(50.0))),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const DefaultTextFormFieldWidget(
                              prefix: Icon(Icons.search),
                              borderRadius: 50,
                              hintText: 'Change Name',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                DefaultMaterialButton(
                                  function: () {},
                                  text: "Update",
                                  buttonColor: mainBackgroundColor,
                                  textStyle:
                                      const TextStyle(color: Colors.white),
                                ),
                                DefaultMaterialButton(
                                  function: () {},
                                  text: "Not Now",
                                  buttonBorder: Border.all(
                                    width: 1,
                                    color: mainBackgroundColor,
                                  ),
                                  textStyle:
                                      TextStyle(color: mainBackgroundColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )));
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
              NavigationHelper.doWidgetNavigation(
                  context, ChangePhoneNumberScreen());
            },
            prefixIcon: Icons.phone,
            settingsName: "Mobile number",
            settingsValue: "01027178857",
          ),
          const CustomDividerWidget(),
          CustomRowWidget(
            function: () {
              log("PIN Code clicked.");
              NavigationHelper.doWidgetNavigation(
                  context, const EnablePinCodeScreen());
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
              AlertMenuHelper.showAlertDialog(context);
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
