import 'package:daftary_app/core/shared/models/customer_model.dart';
import 'package:daftary_app/core/shared/widgets/bottom_navigationbar_widget.dart';
import 'package:daftary_app/core/shared/widgets/default_appbar_widget.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_layout_cubit.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_layout_states.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/screens/home_screen.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/screens/more_screen.dart';
import 'package:daftary_app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> bottomNavScreens = [const HomeScreen(), const MoreScreen()];
    List<BottomNavigationBarItem> bottomNavItems = const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.apps_outlined),
        label: "More",
      ),
    ];
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBarWidget(
              onTab: (index) {
                HomeLayoutCubit.get(context).changeBottomNavIndex(index!);
              },
              currentIndex: HomeLayoutCubit.get(context).bottomNavCurrentIndex,
              bottomNavBarItems: bottomNavItems),
          appBar: DefaultAppBarWidget(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset(
                  "assets/icons/youtube_icon.png",
                  height: 40,
                  width: 40,
                ),
              ),
            ],
            backGroundColor: Colors.black,
            title: AppStrings.appNameText,
          ),
          body: bottomNavScreens[
              HomeLayoutCubit.get(context).bottomNavCurrentIndex],
        );
      },
    );
  }
}
