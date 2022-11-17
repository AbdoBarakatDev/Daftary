import 'dart:math';

import 'package:daftary_app/core/shared/models/customer_model.dart';
import 'package:daftary_app/core/shared/widgets/bottom_navigationbar_widget.dart';
import 'package:daftary_app/core/shared/widgets/default_appbar_widget.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_layout_cubit.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_layout_states.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_screen_cubit.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/screens/home_screen.dart';
import 'package:daftary_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeLayoutCubit>(
      create: (context) => HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: ((context, state) {}),
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: const BottomNavigationBarWidget(
                currentIndex: 0,
                bottomNavBarItems: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.apps_outlined),
                    label: "More",
                  ),
                ]),
            appBar: const DefaultAppBarWidget(
              backGroundColor: Colors.black,
              title: AppStrings.appNameText,
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                var rng = Random();
                for (var i = 0; i < 10; i++) {
                  // print(rng.nextInt(100));
                }
                var list = ['abdo BK', 'ahemd', 'mohamed', 'Maher', 'Ali Ali'];
                final _random = Random();
                String element = list[_random.nextInt(list.length)];

                // HomeLayoutCubit.get(context).getUserData();
                HomeScreenCubit.get(context).insertInCustomers(CustomerModel(
                    id: rng.nextInt(100),
                    name: element,
                    get: 10,
                    phone: "092303"));
              },
              heroTag: "Add Customer",
              tooltip: "Add Customer",
              label: const Text("Add Customer"),
              icon: const Icon(Icons.add),
            ),
            body: const HomeScreen(),
          );
        },
      ),
    );
  }
}
