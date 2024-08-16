import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts {
  static final fontPrimary = GoogleFonts.afacad();
  static final TextStyle headerStyle =
      fontPrimary.copyWith(fontSize: 16, fontWeight: FontWeight.w700);
  static final TextStyle titleStyle =
      GoogleFonts.afacad(fontSize: 10, fontWeight: FontWeight.w500, height: 1);
  static final TextStyle textStyle = fontPrimary.copyWith(
    fontSize: 12,
  );
  static final TextStyle textButtonStyle =
      fontPrimary.copyWith(fontSize: 12, fontWeight: FontWeight.w500);
}

extension CoppyWithFontSize on TextStyle {
  TextStyle get s10 => copyWith(fontSize: 10);
  TextStyle get s12 => copyWith(fontSize: 12);
  TextStyle get s14 => copyWith(fontSize: 14);
  TextStyle get s16 => copyWith(fontSize: 16);
  TextStyle get s18 => copyWith(fontSize: 18);
  TextStyle get s20 => copyWith(fontSize: 20);
  TextStyle get s22 => copyWith(fontSize: 22);
}
