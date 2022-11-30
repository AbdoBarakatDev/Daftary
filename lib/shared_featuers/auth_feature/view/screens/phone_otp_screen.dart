import 'dart:developer';

import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:daftary_app/core/shared/widgets/default_text_form_field.dart';
import 'package:daftary_app/core/shared/widgets/loading_widget.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_otp_cubit.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_otp_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneOtpScreen extends StatelessWidget {
  final String verificationId;

  PhoneOtpScreen({
    Key? key,
    required this.verificationId,
  }) : super(key: key);
  final TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    log("Verification OTP:  $verificationId");
    return BlocConsumer<PhoneOtpCubit, PhoneOtpStates>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return (state is PhoneOtpGetCodeLoadingStates)
            ? const LoadingWidget()
            : Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Center(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Type 6-digits OTP code sent to you",
                              style: TextStyle(
                                  fontSize: 20, color: defaultAppColor),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 130,
                              child: DefaultTextFormFieldWidget(
                                height: 80,
                                hintText: "OTP",
                                hidden: true,
                                autofillHints: const [
                                  AutofillHints.oneTimeCode
                                ],
                                textInputType: TextInputType.phone,
                                borderRadius: 20,
                                controller: otpController,
                                prefix: const Icon(
                                  Icons.verified_user_outlined,
                                  color: defaultAppColor,
                                ),
                                validatorFunction: (val) {
                                  if (val!.length != 6) {
                                    return "Incorrect OTP Code";
                                  }
                                },
                                onSubmitted: (val) async {
                                  PhoneOtpCubit.get(context).getOtpCode(
                                      context: context,
                                      verificationId: verificationId,
                                      smsCode: otpController.text);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
