import 'package:daftary_app/modules/customers_module/home_feature/controller/home_screen_cubit.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_screen_states.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/home_header_widget.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/list_customers.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/pudget_widget.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/search_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(),
      child: BlocConsumer<HomeScreenCubit, HomeScreenStates>(
          listener: ((context, state) {}),
          builder: ((context, state) {
            return Scaffold(
              body: Column(children: const [
                HomeHeaderWidget(),
                PugetWidget(willGet: 4020, willGive: 50),
                SearchSection(),
                ListCustomers(),
              ]),
            );
          })),
    );
  }
}
