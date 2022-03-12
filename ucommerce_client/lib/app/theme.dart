import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UcommerceColors {
  static const color1 = Color(0xFFFFAA00);
  static const color2 = Color(0xFF3F3E4E);
  static const color3 = Color(0xFF758BFD);
  static const color4 = Color(0xFF4817AA);
  static const color5 = Color(0xFFEFEDF3);
  static const color6 = Color(0xFFDBDDEB);
  static const color7 = Color(0xFFDBD1BD);
}

/* final uCommerceGradient = [
  UcommerceColors.color3,
  UcommerceColors.color4,
  UcommerceColors.color1
]; */

final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
  color: UcommerceColors.color4,
  titleTextStyle: GoogleFonts.poppins(
    textStyle: TextStyle(
        color: UcommerceColors.color5,
        fontStyle: FontStyle.normal,
        fontSize: 20,
        fontWeight: FontWeight.bold),
  ),
  //textTheme: ,
));
