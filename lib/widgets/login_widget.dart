import 'package:fl_country_code_picker/fl_country_code_picker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/utils/appConstants.dart';
import 'package:get_x/view/otp_verification.dart';
import 'package:get_x/widgets/text_widget.dart';
import 'package:google_fonts/google_fonts.dart';

Widget loginWidget(
    CountryCode countryCode, Function onCountryChange, Function onSubmit) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget(text: AppConstants.helloNiceToMeetYou),
        const SizedBox(
          height: 5,
        ),
        textWidget(
            text: AppConstants.gethovingWithGreenTaxi,
            fontsize: 20,
            fontWeight: FontWeight.bold),
        const SizedBox(
          height: 40,
        ),
        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 3,
                blurRadius: 3,
              )
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () => onCountryChange(),
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: countryCode.flagImage(),
                            )),
                            const SizedBox(
                              width: 3,
                            ),
                            textWidget(text: countryCode.dialCode),
                            const Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        ),
                      ),
                    )),
                Container(
                  width: 1,
                  height: 55,
                  color: Colors.black.withOpacity(0.2),
                ),
                Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onSubmitted: (String? input) => onSubmit(input),
                        decoration: const InputDecoration(
                          hintText: AppConstants.enterMobileNumber,
                          border: InputBorder.none,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 14,
              ),
              children: [
                const TextSpan(
                  text: AppConstants.byCreating + ' ',
                ),
                TextSpan(
                  text: AppConstants.termsOfService + ' ',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text: 'and' + ' ',
                ),
                TextSpan(
                  text: AppConstants.privacyPolicy + ' ',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ]),
        ),
      ],
    ),
  );
}
