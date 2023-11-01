import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Define a class for managing custom fonts and text styles --------------------
class KFonts {
  // Create a text style with the Poppins font --------------------------------
  static TextStyle poppins({
    Color color = Colors.black,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
