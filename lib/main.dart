import 'package:daftary_app/core/shared/styles/themes.dart';
import 'package:daftary_app/core/shared/widgets/error_widget.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_layout_cubit.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_screen_cubit.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_auth_cubit.dart';
import 'package:daftary_app/shared_featuers/auth_feature/controller/phone_otp_cubit.dart';
import 'package:daftary_app/shared_featuers/auth_feature/view/screens/phone_auth_screen.dart';
import 'package:daftary_app/shared_featuers/pin_code_featue/controller/pin_code_cubit.dart';
import 'package:daftary_app/shared_featuers/pin_code_featue/view/screens/pin_code_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const DaftaryApp());
}

class DaftaryApp extends StatelessWidget {
  const DaftaryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeLayoutCubit>(create: (context) => HomeLayoutCubit()),
        BlocProvider<HomeScreenCubit>(create: (context) => HomeScreenCubit()),
        BlocProvider<PhoneAuthCubit>(create: (context) => PhoneAuthCubit()),
        BlocProvider<PhoneOtpCubit>(create: (context) => PhoneOtpCubit()),
        BlocProvider<PinCodeScreenCubit>(
            create: (context) =>
                PinCodeScreenCubit()..initializeCurrentUserId()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: PhoneAuthScreen(),
      ),
    );
  }
}
