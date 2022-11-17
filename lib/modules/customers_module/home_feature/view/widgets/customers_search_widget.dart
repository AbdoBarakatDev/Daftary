import 'package:daftary_app/core/shared/widgets/default_text_form_field.dart';
import 'package:flutter/material.dart';

class DefaultSearchWidget extends StatelessWidget {
  const DefaultSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTextFormFieldWidget(
      isDense: true,
      hintText: "Search....",
      height: 50,
      prefix: Icon(Icons.search),
      borderRadius: 10,
    );
  }
}
