import 'dart:async';
import 'package:daftary_app/modules/customers_module/home_feature/view/screens/home_layout.dart';
import 'package:daftary_app/shared_featuers/pin_code_featue/controller/pin_code_cubit.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeWidget extends StatelessWidget {
  PinCodeWidget({
    Key? key,
    this.pinCodeLength,
    this.onComplete,
    this.onChange,
    this.width,
    this.fieldWidth,
    this.outlineBorderRadius,
    this.textStyle,
    this.fieldStyle,
    this.obscure,
    this.textFieldAlignment,
  }) : super(key: key);
  final double? width;
  final double? fieldWidth;
  final double? outlineBorderRadius;
  final TextStyle? textStyle;
  final FieldStyle? fieldStyle;
  final bool? obscure;
  final MainAxisAlignment? textFieldAlignment;
  final String? Function(String? val)? onComplete;
  final String? Function(String? val)? onChange;
  final int? pinCodeLength;
  final OtpFieldController otpController = OtpFieldController();
  final StreamController<ErrorAnimationType>? errorController =
      StreamController<ErrorAnimationType>();
  final Color pinCodeBackgroundColor = Colors.grey.shade200;
  final Color pinCodeBorderColor = Colors.grey.shade600;

  final Color pinCodeCursorColor = Colors.grey.shade900;
  final Color pinCodeTextColor = Colors.black;
  final Color pinCodeSelectedColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
      child: OTPTextField(
        length: pinCodeLength ?? 4,
        width: width ?? MediaQuery.of(context).size.width,
        textFieldAlignment: textFieldAlignment ?? MainAxisAlignment.spaceAround,
        fieldWidth: fieldWidth ?? 45,
        fieldStyle: fieldStyle ?? FieldStyle.box,
        outlineBorderRadius: outlineBorderRadius ?? 15,
        style: textStyle ?? const TextStyle(fontSize: 17),
        controller: otpController,
        onChanged: onChange,
        onCompleted: onComplete,
        obscureText: obscure ?? true,
      ),
    );
  }
}
