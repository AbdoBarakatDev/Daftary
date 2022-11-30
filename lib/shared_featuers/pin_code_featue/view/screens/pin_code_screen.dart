import 'dart:developer';

import 'package:daftary_app/core/shared/helpers.dart/toast_helper.dart';
import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/screens/home_layout.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_otp_cubit.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_otp_states.dart';
import 'package:daftary_app/shared_featuers/pin_code_featue/view/widgets/pin_code_auto_get_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinCodeScreen extends StatelessWidget {
  final String verificationId;
  final TextEditingController otpController = TextEditingController();
  PinCodeScreen({super.key, required this.verificationId});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhoneOtpCubit, PhoneOtpStates>(
      listener: (context, state) {
        if (state is PhoneOtpGetCodeSuccessStates) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeLayout(),
              ));
          ToastHelper.showToast(
              message: "Welcome Back", color: defaultAppColor as MaterialColor);
        } else {
          ToastHelper.showToast(
              message: "Wrong Verification Code", color: Colors.red);
        }
      },
      builder: (context, state) => MaterialApp(
        theme: ThemeData.light(),
        home: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    "Enter 6-digits sent to your phone",
                    style: TextStyle(color: defaultAppColor, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  PinCodeAutoGetWidget(
                    otpController: otpController,
                    code: PhoneOtpCubit.get(context).pinCode,
                    onChange: (code) async {
                      log("controller text is : $code & in cubit: ${PhoneOtpCubit.get(context).pinCode}");
                      PhoneOtpCubit.get(context)
                          .validatePinCode(code.toString());
                      if (code!.length == 6) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        PhoneOtpCubit.get(context).getOtpCode(
                            context: context,
                            verificationId: verificationId,
                            smsCode: otpController.text);
                      }
                    },
                    onComplete: (code) async {
                      PhoneOtpCubit.get(context).getOtpCode(
                          context: context,
                          verificationId: verificationId,
                          smsCode: otpController.text);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
