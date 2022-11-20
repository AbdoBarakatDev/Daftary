import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:daftary_app/core/shared/widgets/default_appbar_widget.dart';
import 'package:daftary_app/core/shared/widgets/default_material_button.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_screen_cubit.dart';
import 'package:daftary_app/modules/customers_module/home_feature/controller/home_screen_states.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/screens/customers_screen.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/screens/suppliers_screen.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/custom_container_widget.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/home_header_widget.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/list_customers.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/pudget_widget.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/search_section.dart';
import 'package:flutter/gestures.dart';
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
            return DefaultTabController(
              initialIndex: HomeScreenCubit.get(context).tabBarIndex,
              length: 2,
              child: Scaffold(
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {},
                  heroTag: HomeScreenCubit.get(context).tabBarIndex == 0
                      ? "Add Customer"
                      : "Add Supplier",
                  tooltip: HomeScreenCubit.get(context).tabBarIndex == 0
                      ? "Add Customer"
                      : "Add Supplier",
                  label: Text(HomeScreenCubit.get(context).tabBarIndex == 0
                      ? "Add Customer"
                      : "Add Supplier"),
                  icon: const Icon(Icons.add),
                ),
                appBar: DefaultAppBarWidget(
                  bottom: PreferredSize(
                    preferredSize: const Size(2.0, 300.0),
                    child: Theme(
                      data: ThemeData(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        width: 290,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TabBar(
                                onTap: ((value) {
                                  HomeScreenCubit.get(context)
                                      .changeTabBarIndex(value);
                                }),

                                isScrollable: false,
                                indicatorColor: Colors.transparent,
                                // padding: EdgeInsets.zero,

                                tabs: [
                                  Tab(
                                    iconMargin: EdgeInsets.zero,
                                    icon: CustomContainerWidget(
                                      isActive: HomeScreenCubit.get(context)
                                                  .tabBarIndex ==
                                              0
                                          ? true
                                          : false,
                                      text: "Customers",
                                    ),
                                  ),
                                  Tab(
                                    iconMargin: EdgeInsets.zero,
                                    icon: CustomContainerWidget(
                                      isActive: HomeScreenCubit.get(context)
                                                  .tabBarIndex ==
                                              1
                                          ? true
                                          : false,
                                      text: "Supplier",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.file_present_sharp,
                                  size: 40,
                                  color: pdfIconColor,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  title: '',
                ),
                body: const TabBarView(
                  children: [
                    CustomersScreen(),
                    SuppliersScreen(),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
