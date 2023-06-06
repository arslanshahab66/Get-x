import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

textWidget({
  required String text,
  double fontsize = 14,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return Text(
    text,
    
    style: GoogleFonts.poppins(
      fontSize: fontsize,
      fontWeight: fontWeight,
    ),
  );
}
