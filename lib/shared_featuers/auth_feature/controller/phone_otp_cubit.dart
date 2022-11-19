import 'dart:developer';

import 'package:daftary_app/modules/customers_module/home_feature/view/screens/home_layout.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_otp_states.dart';
import 'package:daftary_app/shared_featuers/auth_feature/view/screens/phone_otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneOtpCubit extends Cubit<PhoneOtpStates> {
  PhoneOtpCubit() : super(PhoneOtpInitialStates());
  static PhoneOtpCubit get(BuildContext context) => BlocProvider.of(context);

  getOtpCode(
      {required BuildContext context,
      required String verificationId,
      required String smsCode}) async {
    emit(PhoneOtpGetCodeLoadingStates());
    FirebaseAuth auth = FirebaseAuth.instance;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    try {
      await auth.signInWithCredential(credential);
      if (auth.currentUser?.uid != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeLayout(),
            ));
      }
      emit(PhoneOtpGetCodeSuccessStates());
    } catch (e) {
      log(e.toString());
      emit(PhoneOtpGetCodeErrorStates());
    }
  }
}
