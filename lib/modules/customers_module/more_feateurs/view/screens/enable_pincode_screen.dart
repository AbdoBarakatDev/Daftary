import 'package:daftary_app/core/shared/helpers.dart/navigation_helper.dart';
import 'package:daftary_app/core/shared/widgets/default_appbar_widget.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/custom_divider_widget.dart';
import 'package:daftary_app/modules/customers_module/more_feateurs/view/screens/change_pincode_screen.dart';
import 'package:flutter/material.dart';

class EnablePinCodeScreen extends StatelessWidget {
  const EnablePinCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: "PIN Code",
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text("PIN"),
                  const Spacer(),
                  Switch(
                    value: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ),
          const CustomDividerWidget(),
          SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text("Change PIN"),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      NavigationHelper.doWidgetNavigation(
                          context, const ChangePinCodeScreen());
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const CustomDividerWidget(),
        ]),
      ),
    );
  }
}
