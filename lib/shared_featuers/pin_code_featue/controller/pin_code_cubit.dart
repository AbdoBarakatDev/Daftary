import 'dart:developer';
import 'package:daftary_app/core/shared/helpers.dart/shared_pref_helper.dart';
import 'package:daftary_app/core/shared/models/user_model.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/screens/home_layout.dart';
import 'package:daftary_app/shared_featuers/pin_code_featue/controller/pin_code_states.dart';
import 'package:daftary_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinCodeScreenCubit extends Cubit<PinCodeScreenStates> {
  PinCodeScreenCubit() : super(PinCodeInitialState());
  static PinCodeScreenCubit get(BuildContext context) =>
      BlocProvider.of(context);

  pinCodeValidation({required BuildContext context, required String value}) {
    emit(PinCodeValidationLoadingState());
    log("=> Is Logged before: $isLoggedBefore ");
    log("=> Id before: $myCurrentUserId");
    log("=> PinCode : $myCurrentUserPinCode");
    myCurrentUserPinCode = value;
    if (isLoggedBefore) {
      if (myCurrentUserPinCode != null && myCurrentUserPinCode == value) {
        saveCurrentUserData(UserModel(
            id: myCurrentUserId!, pinCode: value, isLoggedBefore: true));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeLayout(),
            ));
        emit(PinCodeValidationSuccessState());
      } else {
        log("User Pin Code Error");
        // todo: error pin Code
        emit(PinCodeValidationErrorState());
      }
    } else {
      saveCurrentUserData(UserModel(
          id: myCurrentUserId!, pinCode: value, isLoggedBefore: true));
      log("User didn't logged yet");
    }
  }

  saveCurrentUserData(UserModel userModel) async {
    CashHelper.putData(key: userId, value: userModel.id);
    CashHelper.putData(key: userName, value: userModel.id);
    CashHelper.putData(key: userEmail, value: userModel.id);
    CashHelper.putData(key: userPhone, value: userModel.id);
    CashHelper.putData(key: userPinCode, value: userModel.id);
  }

  getUserData() async {
    log("userId======> ${CashHelper.getData(key: userId)}");
    log("userName======> ${CashHelper.getData(key: userName)}");
    log("userEmail======> ${CashHelper.getData(key: userEmail)}");
    log("userPhone======> ${CashHelper.getData(key: userPhone)}");
    log("userPinCode======> ${CashHelper.getData(key: userPinCode)}");
    return UserModel(
      id: CashHelper.getData(key: userId)!,
      name: CashHelper.getData(key: userName),
      email: CashHelper.getData(key: userEmail),
      phone: CashHelper.getData(key: userPhone),
      pinCode: CashHelper.getData(key: userPinCode),
    );
  }
}
