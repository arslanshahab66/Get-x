import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/techoverflow_task/bottom_nav_bar.dart';
import 'package:get_x/view/homepage_screen.dart';
import 'package:get_x/view/login_screen.dart';
import 'package:get_x/view/profile_settings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controller/auth_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    authController.decideRoute();
    final textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // locale: Locale('en', 'US'),
      // fallbackLocale: Locale('en', 'US'),
      // translations: Languages(),
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme,
      )),
      home: const LoginScreen(),
    );
  }
}
