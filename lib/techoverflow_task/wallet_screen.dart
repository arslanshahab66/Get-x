import 'package:flutter/material.dart';
import 'package:get_x/techoverflow_task/reuseable_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/wallet.png'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    'Wallet',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            const Icon(
              Icons.wallet,
              color: Colors.white,
              size: 45,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "You don't have wallets",
              style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "You need to register a wallet to be able\n to carry out operations",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ReuseableListTile(
                title: 'Create a new wallet',
                subtitile: 'Generate a new wallet address',
                leadingicon: Icons.wallet),
            const SizedBox(
              height: 15,
            ),
            ReuseableListTile(
                title: 'Import private key',
                subtitile: 'Import an existing wallet address',
                leadingicon: Icons.arrow_back_rounded)
          ],
        ),
      ),
    );
  }
}
