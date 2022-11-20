import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/list_customers.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/pudget_widget.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/search_section.dart';
import 'package:daftary_app/utils/dummy.dart';
import 'package:flutter/material.dart';

class SuppliersScreen extends StatelessWidget {
  const SuppliersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // HomeHeaderWidget(),
          const PugetWidget(willGet: 0, willGive: 0),
          const SearchSection(),
          CustomUsersList(listUserType: DummyData.suppliers),
        ],
      ),
    );
  }
}
