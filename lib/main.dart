import 'dart:developer';
import 'package:daftary_app/core/shared/helpers.dart/shared_pref_helper.dart';
import 'package:daftary_app/core/shared/styles/themes.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_layout_cubit.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_screen_cubit.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/screens/home_layout.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_auth_cubit.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_otp_cubit.dart';
import 'package:daftary_app/shared_featuers/auth_feature/view/screens/phone_auth_screen.dart';
import 'package:daftary_app/shared_featuers/pin_code_featue/controller/pin_code_cubit.dart';
import 'package:daftary_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

Widget? startScreen;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await CashHelper.init();
  myCurrentUserId = CashHelper.getData(key: userId);
  log("++++++>>>> ${CashHelper.getData(key: userId)}");
  log("AppName>>>> ${CashHelper.getData(key: userName)}");
  if (CashHelper.getData(key: userId) != null) {
    log("Already Logged Before $myCurrentUserId");
    startScreen = const HomeLayout();
  } else {
    log("Didn't Logged Yet");
    startScreen = PhoneAuthScreen();
  }

  runApp(DaftaryApp(
    startScreen: startScreen!,
  ));
}

class DaftaryApp extends StatelessWidget {
  final Widget startScreen;
  const DaftaryApp({Key? key, required this.startScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeLayoutCubit>(create: (context) => HomeLayoutCubit()),
        BlocProvider<HomeScreenCubit>(create: (context) => HomeScreenCubit()),
        BlocProvider<PhoneAuthCubit>(create: (context) => PhoneAuthCubit()),
        BlocProvider<PhoneOtpCubit>(create: (context) => PhoneOtpCubit()),
        BlocProvider<PinCodeScreenCubit>(
            create: (context) => PinCodeScreenCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: startScreen,
      ),
    );
  }
}
