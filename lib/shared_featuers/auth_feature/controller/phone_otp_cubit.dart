import 'dart:developer';

import 'package:daftary_app/modules/customers_module/home_feature/view/screens/home_layout.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_otp_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneOtpCubit extends Cubit<PhoneOtpStates> {
  PhoneOtpCubit() : super(PhoneOtpInitialStates());
  static PhoneOtpCubit get(BuildContext context) => BlocProvider.of(context);
  String pinCode = '';
  validatePinCode(String value) {
    pinCode = value;
    log(pinCode);
    emit(ChangePinCodeTextState());
  }

  getOtpCode(
      {required BuildContext context,
      required String verificationId,
      required String smsCode}) async {
    log("controller text is : $smsCode & in cubit: $pinCode");
    emit(PhoneOtpGetCodeLoadingStates());
    FirebaseAuth auth = FirebaseAuth.instance;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    try {
      await auth.signInWithCredential(credential);
      if (auth.currentUser?.uid != null) {
        emit(PhoneOtpGetCodeSuccessStates());
      }
    } catch (e) {
      log(e.toString());
      emit(PhoneOtpGetCodeErrorStates(e.toString()));
    }
  }
}
