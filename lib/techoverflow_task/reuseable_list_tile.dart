import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ReuseableListTile extends StatelessWidget {
  ReuseableListTile(
      {super.key,
      required this.title,
      required this.subtitile,
      required this.leadingicon});
  String title;
  String subtitile;
  IconData leadingicon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .1,
      width: MediaQuery.of(context).size.width * .9,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 7, 12, 47),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            title: Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            subtitle: Text(
              subtitile,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white70),
            ),
            leading: Icon(
              leadingicon,
              size: 30,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }
}
