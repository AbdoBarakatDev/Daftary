import 'package:daftary_app/core/shared/models/user_model.dart';
import 'package:daftary_app/core/shared/styles/themes.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_layout_cubit.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_screen_cubit.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/screens/home_layout.dart';
import 'package:daftary_app/shared_featuers/pin_code_featue/controller/pin_code_cubit.dart';
import 'package:daftary_app/shared_featuers/pin_code_featue/view/screens/pin_code_screen.dart';
import 'package:daftary_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiBlocProvider(
      providers: [
        BlocProvider<PinCodeScreenCubit>(
            create: (context) =>
                PinCodeScreenCubit()..initializeCurrentUserId()),
      ],
      child: PinCodeScreen(),
    ),
    theme: lightTheme,
  ));
}
