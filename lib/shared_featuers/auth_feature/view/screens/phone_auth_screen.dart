import 'dart:developer';

import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:daftary_app/core/shared/widgets/default_material_button.dart';
import 'package:daftary_app/core/shared/widgets/default_text_form_field.dart';
import 'package:daftary_app/core/shared/widgets/loading_widget.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_auth_cubit.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_auth_states.dart';
import 'package:daftary_app/shared_featuers/auth_feature/view/screens/phone_otp_screen.dart';
import 'package:daftary_app/shared_featuers/auth_feature/view/widgets/phone_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneAuthScreen extends StatelessWidget {
  PhoneAuthScreen({Key? key}) : super(key: key);
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhoneAuthCubit>(
      create: (context) => PhoneAuthCubit(),
      child: BlocConsumer<PhoneAuthCubit, PhoneAuthStates>(
          listener: ((context, state) {}),
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Type Your Phone Starts with Country code",
                          style:
                              TextStyle(fontSize: 20, color: defaultAppColor),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        PhonePickerWidget(
                          onSaved: (value) {
                            log("on Saved Complete Number: ${value!.completeNumber.toString()}");
                          },
                          validator: (phone) {
                            log("on validator Complete Number: ${phone!.completeNumber.toString()}");
                            return PhoneAuthCubit.get(context)
                                .validatePhone(phone.completeNumber);
                          },
                          phoneController: phoneController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        (state is PhoneAuthSentCodeLoadingStates)
                            ? const SizedBox(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : DefaultMaterialButton(
                                buttonColor: defaultAppColor,
                                isSelected: true,
                                textColor: secondAppColor,
                                function: () {
                                  log("=====>Phone Controller is ${PhoneAuthCubit.get(context).fullPhoneNumber}");
                                  if (_formKey.currentState!.validate()) {
                                    PhoneAuthCubit.get(context)
                                        .sendPhoneVerification(
                                            context,
                                            PhoneAuthCubit.get(context)
                                                .fullPhoneNumber);
                                  }
                                },
                                text: "Send Verification Code"),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
