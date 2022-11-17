import 'package:daftary_app/core/shared/widgets/default_drop_down_button_widget.dart';
import 'package:daftary_app/modules/customers_module/home_feature/view/widgets/customers_search_widget.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Row(children: [
          const Expanded(flex: 1, child: DefaultSearchWidget()),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 1,
            child: DefaultDropDownButtonWidget(
                height: 50,
                isDense: true,
                onChange: (val) {
                  return;
                  // select any thing
                },
                dropList: const [
                  DropdownMenuItem(
                    value: "All Customers",
                    child: Text(
                      "All Customers",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Today's Transactions",
                    child: Text(
                      "Today's Transactions",
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ]),
          )
        ]),
      ),
    );
  }
}
