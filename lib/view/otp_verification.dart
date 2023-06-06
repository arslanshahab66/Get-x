import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_x/controller/auth_controller.dart';
import 'package:get_x/utils/appColors.dart';
import 'package:get_x/widgets/green_intro_widget.dart';
import 'package:get_x/widgets/otp_verification_widget.dart';

class OtpVerificationScreen extends StatefulWidget {
  String phoneNumber;
  OtpVerificationScreen(this.phoneNumber);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController.phoneAuth(widget.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(children: [
              greenIntroWidget(),
              Positioned(
                top: 80,
                left: 30,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.greenColor,
                    ),
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 50,
            ),
            otpVerificationWidget(),
          ],
        ),
      ),
    );
  }
}
