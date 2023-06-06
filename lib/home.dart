import 'package:flutter/material.dart';

import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx Languages'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title: Text(
                'message'.tr,
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                'name'.tr,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Get.updateLocale(
                      const Locale('en', 'US'),
                    );
                  },
                  child: const Text('English'),
                ),
                const SizedBox(
                  width: 20,
                ),
                OutlinedButton(
                  onPressed: () {
                    Get.updateLocale(
                      const Locale('ur', 'PK'),
                    );
                  },
                  child: const Text('Urdu'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
