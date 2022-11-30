import 'dart:developer';

import 'package:daftary_app/core/shared/helpers.dart/toast_helper.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_auth_states.dart';
import 'package:daftary_app/shared_featuers/pin_code_featue/view/screens/pin_code_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthStates> {
  PhoneAuthCubit() : super(PhoneAuthInitialStates());
  static PhoneAuthCubit get(BuildContext context) => BlocProvider.of(context);

  String fullPhoneNumber = "";

  validatePhone(String phone) {
    String result = "";
    String pattern = r'/^([+]\d{2})?\d{10}$/';
    RegExp regex = RegExp(pattern);
    if (phone.isEmpty) {
      result = 'Please enter mobile number';
    } else if (!regex.hasMatch(phone.trim().toString())) {
      log("===================>>>>Not Valid Number");
      result = 'Please enter valid mobile number';
    }
    fullPhoneNumber = phone;
    return result;
  }

  Future<void> sendPhoneVerification(
      BuildContext context, String phoneNumber) async {
    emit(PhoneAuthSentCodeLoadingStates());
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          log('The provided phone number is not valid.');
          emit(PhoneAuthSentCodeErrorStates());
          ToastHelper.showToast(
            message: "The provided phone number is not valid.",
            color: Colors.red,
          );
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        emit(PhoneAuthSentCodeSuccessStates());
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PinCodeScreen(verificationId: verificationId),
            ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
