import 'dart:developer';
import 'dart:math' as math;
import 'package:daftary_app/core/shared/models/user_model.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/screens/home_layout.dart';
import 'package:daftary_app/shared_featuers/pin_code_featue/controller/pin_code_states.dart';
import 'package:daftary_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PinCodeScreenCubit extends Cubit<PinCodeScreenStates> {
  PinCodeScreenCubit() : super(PinCodeInitialState());
  static PinCodeScreenCubit get(BuildContext context) =>
      BlocProvider.of(context);

  Future<String?> initializeCurrentUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    log("userId======> ${pref.getString(userId)}");
    generateNewUserId();
    myCurrentUserId = pref.getString(userId);
    return myCurrentUserId;
  }

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
      initializeCurrentUserId();
      saveCurrentUserData(UserModel(
          id: myCurrentUserId!, pinCode: value, isLoggedBefore: true));
      log("User didn't logged yet");
    }
  }

  saveCurrentUserData(UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(userId, userModel.id);
    preferences.setString(userName, userModel.name ?? "");
    preferences.setString(userEmail, userModel.email ?? "");
    preferences.setString(userPhone, userModel.phone ?? "");
    preferences.setString(userPinCode, userModel.pinCode ?? "");
    preferences.setString(userPinCode, userModel.pinCode ?? "");
    preferences.setBool(userPinCode, userModel.isLoggedBefore ?? false);
  }

  getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    log("userId======> ${pref.getString(userId)}");
    log("userName======> ${pref.getString(userName)}");
    log("userEmail======> ${pref.getString(userEmail)}");
    log("userPhone======> ${pref.getString(userPhone)}");
    log("userPinCode======> ${pref.getString(userPinCode)}");
    return UserModel(
      id: pref.getString(userId)!,
      name: pref.getString(userName),
      email: pref.getString(userEmail),
      phone: pref.getString(userPhone),
      pinCode: pref.getString(userPinCode),
    );
  }

  void generateNewUserId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(userId, generateRandomId(len: 10));
    myCurrentUserId = preferences.getString(userId);
  }

  String generateRandomId({int len = 10}) {
    var r = math.Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }
}
