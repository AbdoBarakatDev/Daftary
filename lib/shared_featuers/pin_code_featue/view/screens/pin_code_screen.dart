import 'package:daftary_app/core/shared/models/user_model.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_layout_cubit.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_screen_cubit.dart';
import 'package:daftary_app/shared_featuers/pin_code_featue/controller/pin_code_cubit.dart';
import 'package:daftary_app/shared_featuers/pin_code_featue/controller/pin_code_states.dart';
import 'package:daftary_app/shared_featuers/pin_code_featue/view/widgets/pin_code_widget.dart';
import 'package:daftary_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinCodeScreen extends StatelessWidget {
  PinCodeScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PinCodeScreenCubit, PinCodeScreenStates>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            minimum: const EdgeInsets.only(top: 100),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    AppStrings.pinCodeText,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PinCodeWidget(
                    onChange: (val) {
                      PinCodeScreenCubit.get(context)
                          .pinCodeValidation(context: context, value: val!);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
