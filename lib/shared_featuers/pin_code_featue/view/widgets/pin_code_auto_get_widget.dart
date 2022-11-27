import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class PinCodeAutoGetWidget extends StatelessWidget {
  final int? maxLength;
  final dynamic Function(String)? onComplete;
  final dynamic Function(String?)? onChange;

  final TextEditingController? otpController;
  final PinDecoration? decoration;
  final String? code;
  const PinCodeAutoGetWidget({
    Key? key,
    this.onComplete,
    required this.onChange,
    this.otpController,
    this.code,
    this.maxLength,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinFieldAutoFill(
      controller: otpController,
      decoration: decoration ??
          BoxLooseDecoration(
            obscureStyle: ObscureStyle(isTextObscure: true),
            textStyle: const TextStyle(fontSize: 20, color: Colors.black),
            strokeColorBuilder:
                FixedColorBuilder(Colors.black.withOpacity(0.3)),
          ),
      currentCode: code,
      onCodeSubmitted: onComplete,
      onCodeChanged: onChange,
    );
  }
}
