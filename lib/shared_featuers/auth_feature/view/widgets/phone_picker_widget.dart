import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhonePickerWidget extends StatelessWidget {
  final TextEditingController? phoneController;
  final bool? isDense;
  final String? initialCountryCode;
  final String? labelText;
  final TextInputType? keyboardType;
  final ValueChanged<void>? onChanged;
  final ValueChanged<void>? onCountryChanged;
  final void Function(PhoneNumber?)? onSaved;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final InputBorder? border;
  final List<TextInputFormatter>? inputFormatters;

  const PhonePickerWidget(
      {Key? key,
      this.phoneController,
      this.isDense,
      this.initialCountryCode,
      this.keyboardType,
      this.onChanged,
      this.onCountryChanged,
      this.onSaved,
      this.labelText,
      this.validator,
      this.border,
      this.inputFormatters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      initialCountryCode: initialCountryCode ?? "EG",
      controller: phoneController,
      decoration: InputDecoration(
        isDense: isDense ?? true,
        labelText: labelText ?? 'Phone Number',
        border: border ??
            const OutlineInputBorder(
              borderSide: BorderSide(),
            ),
      ),
      keyboardType: keyboardType ?? TextInputType.phone,
      inputFormatters:
          inputFormatters ?? [FilteringTextInputFormatter.digitsOnly],
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved ??
          (newValue) {
            // fullMobileNumberWithCode = newValue!.completeNumber.toString();
            log('phoneController on: ${phoneController!.text}');
          },
      onCountryChanged: onCountryChanged ??
          (country) {
            log('Country changed to: ${country.name}');
          },
    );
  }
}
