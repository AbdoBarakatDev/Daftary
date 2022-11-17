import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class ListBuilderWidget extends StatelessWidget {
  const ListBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 70,
              width: double.infinity,
              child: Row(
                children: const [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: defaultAppColor,
                    child: Text("AB"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Text("Abdo Barakat")),
                  Spacer(),
                  Text(
                    "20",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(
              color: separatorColor,
              height: 1,
              indent: 20,
              endIndent: 20,
            ),
        itemCount: 10);
  }
}
