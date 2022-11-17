import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:daftary_app/core/shared/widgets/default_material_button.dart';
import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: defaultAppColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            DefaultMaterialButton(
              function: () {},
              text: "Customer",
              isSelected: true,
            ),
            const SizedBox(
              width: 10,
            ),
            DefaultMaterialButton(
              function: () {},
              text: "Supplier",
              isSelected: false,
              height: 55,
              radius: 10,
            ),
            const SizedBox(
              width: 10,
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
    );
  }
}
