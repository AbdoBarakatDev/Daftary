import 'dart:developer';

import 'package:daftary_app/core/shared/helpers.dart/navigation_helper.dart';
import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:daftary_app/core/shared/widgets/default_appbar_widget.dart';
import 'package:daftary_app/core/shared/widgets/default_material_button.dart';
import 'package:daftary_app/modules/customers_module/more_feateurs/view/screens/update_phone_pin_code_validation.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_auth_cubit.dart';
import 'package:daftary_app/shared_featuers/auth_feature/view/widgets/phone_picker_widget.dart';
import 'package:flutter/material.dart';

class ChangePhoneNumberScreen extends StatelessWidget {
  ChangePhoneNumberScreen({Key? key}) : super(key: key);
  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: "Change Phone Number ",
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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              PhonePickerWidget(
                onSaved: (value) {
                  log("on Saved Complete Number: ${value!.completeNumber.toString()}");
                },
                validator: (phone) {
                  log("on validator Complete Number: ${phone!.completeNumber.toString()}");
                  // return PhoneAuthCubit.get(context)
                  //     .validatePhone(phone.completeNumber);
                },
                phoneController: phoneController,
              ),
              const SizedBox(
                height: 10,
              ),
              // (state is PhoneAuthSentCodeLoadingStates)
              //     ? const SizedBox(
              //         child: Center(
              //           child: CircularProgressIndicator(),
              //         ),
              //       )
              //     :
              DefaultMaterialButton(
                  buttonColor: defaultAppColor,
                  isSelected: true,
                  textColor: secondAppColor,
                  function: () {
                    log("=====>Phone Controller is ${PhoneAuthCubit.get(context).fullPhoneNumber}");
                    // if (_formKey.currentState!.validate()) {
                    // PhoneAuthCubit.get(context).sendPhoneVerification(
                    // context, PhoneAuthCubit.get(context).fullPhoneNumber);
                    // }
                    NavigationHelper.doWidgetNavigation(context,
                        UpdatePhonePinCodeValidation(verificationId: "000000"));
                  },
                  text: "Update Phone"),
            ],
          ),
        ),
      ),
    );
  }
}
