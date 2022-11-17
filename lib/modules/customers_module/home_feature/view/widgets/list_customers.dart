import 'package:daftary_app/core/shared/widgets/list_builder_widget.dart';
import 'package:flutter/material.dart';

class ListCustomers extends StatelessWidget {
  const ListCustomers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: SizedBox(height: double.infinity, child: ListBuilderWidget()));
  }
}
