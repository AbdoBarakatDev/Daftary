import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextFormFieldWidget extends StatelessWidget {
  final bool? enabled;
  final String? Function()? onTab;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSubmitted;
  final String hintText;
  final String? labelText;
  // final IconData? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final Color? textColor;
  final Color? hintColor;
  // final Color? prefixIconColor;
  // final Color ?suffixIconColor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final String? Function(String?)? validatorFunction;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderSize;
  final bool? hidden;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool autoCorrect = false;
  final int? maxLines;
  final TextDirection? textDirection;
  final Key? textFieldKey;
  final Color? cursorColor;
  final int? maxLength;
  final double? height;
  final bool? isDense;
  final Iterable<String>? autofillHints;
  final TextAlign? textAlign;
  final EdgeInsets? contentPadding;
  const DefaultTextFormFieldWidget(
      {Key? key,
      this.enabled,
      this.onTab,
      this.onChange,
      this.onSubmitted,
      required this.hintText,
      this.labelText,
      this.prefix,
      this.suffixIcon,
      this.textColor,
      this.hintColor,
      this.hintStyle,
      this.textStyle,
      this.controller,
      this.validatorFunction,
      this.borderRadius,
      this.textInputAction,
      this.textInputType,
      this.textDirection,
      this.textFieldKey,
      this.cursorColor,
      this.maxLength,
      this.contentPadding,
      this.height,
      this.isDense,
      this.textAlign,
      this.autofillHints,
      this.borderColor,
      this.borderSize,
      this.hidden,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60,
      child: TextFormField(
        autofillHints: autofillHints,
        textAlign: textAlign ?? TextAlign.center,
        autocorrect: autoCorrect,
        maxLines: maxLines ?? 1,
        key: textFieldKey,
        cursorColor: cursorColor,
        maxLength: maxLength,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        enabled: enabled,
        obscureText: hidden ?? false,
        style: textStyle,
        controller: controller,
        validator: validatorFunction,
        onTap: onTab,
        onChanged: onChange,
        onFieldSubmitted: onSubmitted,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength,
              maxLengthEnforcement: MaxLengthEnforcement.enforced),
        ],
        decoration: InputDecoration(
          // contentPadding: (prefix != null && prefix is Widget)
          //     ? const EdgeInsets.symmetric(vertical: 2)
          //     : contentPadding ??
          //         const EdgeInsets.only(left: 5, top: 10, bottom: 10),
          labelText: labelText,
          // ignore: unnecessary_null_comparison
          labelStyle: (context != null)
              ? Theme.of(context).textTheme.bodyText2
              : const TextStyle(color: Colors.grey),
          isDense: isDense,
          hintText: hintText,
          hintStyle: hintStyle,
          prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: prefix),
          prefixIconConstraints: prefix is Widget
              ? const BoxConstraints(maxWidth: 100, maxHeight: 50)
              : const BoxConstraints(minWidth: 90),
          // prefixIcon: prefix is Icon ?prefix:Container(),
          // prefix: prefix is Widget?prefix:Container(),
          suffix: Padding(
              padding: const EdgeInsets.only(right: 10), child: suffixIcon),
          border: OutlineInputBorder(
            borderSide: BorderSide(
                width: borderSize ?? 1, color: borderColor ?? Colors.grey),
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: borderSize ?? 1, color: borderColor ?? Colors.grey),
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: borderSize ?? 1, color: borderColor ?? Colors.grey),
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
        ),
      ),
    );
  }
}
