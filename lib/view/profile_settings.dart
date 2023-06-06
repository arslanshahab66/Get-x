import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/controller/auth_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/appColors.dart';
import '../widgets/green_button_widget.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController homeController = TextEditingController();
  TextEditingController businessController = TextEditingController();
  TextEditingController shopController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AuthController authController = Get.find<AuthController>();

  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.4,
              child: Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height * 0.3,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      color: Colors.green,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Profile Settings',
                            style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          getImage(ImageSource.camera);
                        },
                        child: selectedImage == null
                            ? Container(
                                width: 120,
                                height: 120,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffD6D6D6)),
                                child: const Center(
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : Container(
                                width: 120,
                                height: 120,
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(selectedImage!)),
                                    shape: BoxShape.circle,
                                    color: Color(0xffD6D6D6)),
                                child: const Center(
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    textFieldWidget(
                        'Name', Icons.person_outlined, nameController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'Name is required';
                      }
                      if (input.length < 5) {
                        return 'Please enter a valid name';
                      }

                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    textFieldWidget(
                        'Home Address', Icons.home_outlined, homeController,
                        (String? input) {
                      if (input!.isEmpty) {
                        return 'home address is required';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    textFieldWidget('Business Address', Icons.card_travel,
                        businessController, (String? input) {
                      if (input!.isEmpty) {
                        return 'business address is required';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 10,
                    ),
                    textFieldWidget(
                        'Shopping Center',
                        Icons.shopping_cart_outlined,
                        shopController, (String? input) {
                      if (input!.isEmpty) {
                        return 'Shopping address is required';
                      }
                      return null;
                    }),
                    const SizedBox(
                      height: 30,
                    ),
                    Obx(
                      () => authController.isProfileUploading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : greenButton('Submit', () {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                              if (selectedImage == null) {
                                Get.snackbar(
                                    'Warning', 'Please select your image!');
                                return;
                              }
                              authController.isProfileUploading(true);
                              authController.storeUserInfo(
                                  selectedImage!,
                                  nameController.text,
                                  homeController.text,
                                  businessController.text,
                                  shopController.text);
                            }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  textFieldWidget(String title, IconData iconData,
      TextEditingController controller, Function validator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xffA7A7A7)),
        ),
        const SizedBox(
          height: 6,
        ),
        Container(
          width: Get.width,
          // height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 1)
              ],
              borderRadius: BorderRadius.circular(8)),
          child: TextFormField(
            validator: (input) => validator(input),
            controller: controller,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xffA7A7A7)),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  iconData,
                  color: AppColors.greenColor,
                ),
              ),
              border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}
