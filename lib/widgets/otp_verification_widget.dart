

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/utils/appConstants.dart';

import 'package:get_x/widgets/pinput_widget.dart';
import 'package:get_x/widgets/text_widget.dart';
import 'package:google_fonts/google_fonts.dart';

Widget otpVerificationWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(text: AppConstants.phoneverification),
        const SizedBox(
          height: 5,
        ),
        textWidget(
            text: AppConstants.enterOtp,
            fontsize: 20,
            fontWeight: FontWeight.bold),
        const SizedBox(
          height: 40,
        ),
       Container(
        width: Get.width,
        height: 50,
        child: RoundedWithShadow()),
        const SizedBox(
          height: 150,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 14,
                ),
                children: [
                  const TextSpan(
                    text: AppConstants.resendCode + ' ',
                  ),
                  TextSpan(
                    text: '10 seconds',
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
        ),
      ],
    ),
  );
}
