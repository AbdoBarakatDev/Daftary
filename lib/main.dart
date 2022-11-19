import 'package:daftary_app/core/shared/models/user_model.dart';
import 'package:daftary_app/core/shared/styles/themes.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_layout_cubit.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_screen_cubit.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/screens/home_layout.dart';
import 'package:daftary_app/shared_featuers/auth_feature/view/screens/phone_auth_screen.dart';
import 'package:daftary_app/shared_featuers/pin_code_featue/controller/pin_code_cubit.dart';
import 'package:daftary_app/shared_featuers/pin_code_featue/view/screens/pin_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiBlocProvider(
      providers: [
        BlocProvider<PinCodeScreenCubit>(
            create: (context) =>
                PinCodeScreenCubit()..initializeCurrentUserId()),
      ],
      child: PhoneAuthScreen(),
    ),
    theme: lightTheme,
  ));
}
