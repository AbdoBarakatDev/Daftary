import 'package:daftary_app/core/shared/widgets/default_material_button.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final Widget? headerIcon;
  final String? errorText;
  final String? errorHintText;
  final String? buttonText;
  final TextStyle? errorTextStyle;
  final TextStyle? errorHintStyle;
  final TextStyle? buttonTextStyle;
  final Color? buttonColor;
  const CustomErrorWidget(
      {Key? key,
      this.headerIcon,
      this.errorText,
      this.errorHintText,
      this.buttonText,
      this.errorTextStyle,
      this.errorHintStyle,
      this.buttonTextStyle,
      this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: headerIcon ??
                  Icon(
                    Icons.settings,
                    color: Colors.grey.shade100,
                    size: MediaQuery.of(context).size.width,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 100,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Text(
                      errorText ?? "No Connection",
                      style: errorTextStyle ?? const TextStyle(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      errorHintText ??
                          "We are sorry we couldn't find any connection try to connect again and press try again",
                      textAlign: TextAlign.center,
                      style: errorHintStyle ??
                          const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              color: Colors.grey),
                    ),
                    const Spacer(),
                    DefaultMaterialButton(
                      function: () {},
                      text: "TRY AGAIN",
                      buttonColor: Colors.red,
                      textStyle: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
