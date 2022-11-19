import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:daftary_app/core/shared/widgets/default_material_button.dart';
import 'package:daftary_app/core/shared/widgets/default_text_form_field.dart';
import 'package:daftary_app/core/shared/widgets/loading_widget.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_auth_cubit.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_auth_states.dart';
import 'package:daftary_app/shared_featuers/auth_feature/view/screens/phone_otp_screen.dart';
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
                        DefaultTextFormFieldWidget(
                          height: 80,
                          hintText: "Type your phone",
                          textInputType: TextInputType.phone,
                          borderRadius: 20,
                          controller: phoneController,
                          prefix: const Icon(
                            Icons.phone,
                            color: defaultAppColor,
                          ),
                          validatorFunction: (val) {
                            return PhoneAuthCubit.get(context)
                                .validatePhone(phoneController.text);
                          },
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
                                  if (_formKey.currentState!.validate()) {
                                    PhoneAuthCubit.get(context)
                                        .sendPhoneVerification(
                                            context, phoneController.text);
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
