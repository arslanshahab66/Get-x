import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget circleAvatar(
  IconData icon,
  String text,
) {
  return Column(
    children: [
      CircleAvatar(
        radius: 35,
        backgroundColor: Colors.grey.shade900,
        child: Container(
          child: Icon(
            icon,
            size: 25,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const Text(
        '-',
        style: TextStyle(color: Colors.white),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        text,
        style: GoogleFonts.poppins(
            fontSize: 13, fontWeight: FontWeight.normal, color: Colors.white70),
      ),
    ],
  );
}
