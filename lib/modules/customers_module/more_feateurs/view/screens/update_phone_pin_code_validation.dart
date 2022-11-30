import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:daftary_app/core/shared/widgets/default_appbar_widget.dart';
import 'package:daftary_app/core/shared/widgets/default_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UpdatePhonePinCodeValidation extends StatelessWidget {
  UpdatePhonePinCodeValidation({Key? key, required this.verificationId})
      : super(key: key);
  final String verificationId;
  final TextEditingController otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: "OTP Verification ",
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Type 6-digits OTP code sent to you",
                  style: TextStyle(fontSize: 20, color: defaultAppColor),
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
                    autofillHints: const [AutofillHints.oneTimeCode],
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
                      //   PhoneOtpCubit.get(context).getOtpCode(
                      //       context: context,
                      //       verificationId: verificationId,
                      //       smsCode: otpController.text);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
