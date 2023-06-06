import 'package:flutter/material.dart';
import 'package:get_x/techoverflow_task/circle_avatar_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class BlockChainScreen extends StatelessWidget {
  const BlockChainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 12, 47),
      appBar: AppBar(
        title: const Text('EXPLORER'),
        centerTitle: true,
        elevation: 0.1,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * .4,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                circleAvatar(Icons.wallet, 'Total Supply'),
                circleAvatar(Icons.blur_circular_outlined, 'Blocks'),
                circleAvatar(Icons.upgrade_rounded, 'Events'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Blocks',
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              'List of blocks',
              style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.white70),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "Load More",
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
