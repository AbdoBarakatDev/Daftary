import 'package:daftary_app/core/shared/widgets/default_appbar_widget.dart';
import 'package:flutter/material.dart';
import '../../../../../shared_featuers/pin_code_featue/view/widgets/pin_code_widget.dart';

class ChangePinCodeScreen extends StatelessWidget {
  const ChangePinCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBarWidget(
          title: "Change PIN ",
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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Align(alignment: Alignment.topCenter, child: PinCodeWidget())
            ],
          ),
        ));
  }
}
