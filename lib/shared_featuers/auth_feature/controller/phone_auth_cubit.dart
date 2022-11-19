import 'dart:developer';

import 'package:daftary_app/core/shared/helpers.dart/toast_helper.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_auth_states.dart';
import 'package:daftary_app/shared_featuers/auth_feature/view/screens/phone_otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthStates> {
  PhoneAuthCubit() : super(PhoneAuthInitialStates());
  static PhoneAuthCubit get(BuildContext context) => BlocProvider.of(context);

  validatePhone(String phone) {
    String result = "";
    if (!phone.startsWith("+")) {
      result = "Phone should start with Country code i.e +20 for Egypt";
      emit(PhoneAuthValidationStates());
    } else if (phone.length < 13) {
      result = "Type a correct phone number";
      emit(PhoneAuthValidationStates());
    } else {
      return;
    }

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
                  PhoneOtpScreen(verificationId: verificationId),
            ));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
