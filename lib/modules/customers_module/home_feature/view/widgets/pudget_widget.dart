import 'package:daftary_app/core/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class PugetWidget extends StatelessWidget {
  final double willGive;
  final double willGet;
  const PugetWidget({Key? key, required this.willGive, required this.willGet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: defaultAppColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: secondAppColor,
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 100,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${willGive.toInt()} EGP",
                        style: const TextStyle(
                            color: defaultAppColor, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("You Will Give"),
                    ],
                  ),
                  Container(
                    color: Colors.grey,
                    height: 40,
                    width: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${willGet.toInt()} EGP",
                        style: const TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("You Will Get"),
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
