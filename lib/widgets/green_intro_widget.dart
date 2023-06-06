import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

Widget greenIntroWidget() {
  return Container(
    width: Get.width,
    height: Get.height * 0.45,
    decoration: const BoxDecoration(
      color: Colors.green,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Image(
          image: AssetImage(
            'assets/taxii.png',
          ),
          height: 70,
        )
      ],
    ),
  );
}
