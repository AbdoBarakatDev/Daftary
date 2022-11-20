import 'package:daftary_app/core/shared/models/customer_model.dart';
import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class ListBuilderWidget extends StatelessWidget {
  const ListBuilderWidget({Key? key, required this.listUserType})
      : super(key: key);
  final List listUserType;
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
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: defaultAppColor,
                    child: Text(listUserType[index].name![0]),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Text(listUserType[index].name!)),
                  const Spacer(),
                  Text(
                    (listUserType[index].get! >= listUserType[index].give!)
                        ? listUserType[index].get!.toInt().toString()
                        : listUserType[index].give!.toInt().toString(),
                    style: TextStyle(
                        color: (listUserType[index].get! >=
                                listUserType[index].give!)
                            ? Colors.red
                            : mainBackgroundColor),
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
        itemCount: listUserType.length);
  }
}
