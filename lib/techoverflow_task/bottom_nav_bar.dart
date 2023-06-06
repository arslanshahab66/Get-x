import 'package:flutter/material.dart';
import 'package:get_x/techoverflow_task/settings_Screen.dart';
import 'package:get_x/techoverflow_task/wallet_screen.dart';

import 'blockchain_screen.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({Key? key}) : super(key: key);

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int selectedIndex = 0;
  List<Widget> widgetpages = [
    const WalletScreen(),
    const BlockChainScreen(),
    const SettingScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetpages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.crop_square),
            label: "Blockchain",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        // type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        iconSize: 25,
        onTap: onItemTapped,
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 79, 41, 41),
      ),
    );
  }
}
