import 'package:flutter/material.dart';

// Uygulama genelinde renk ve yazı stili erişimini kolaylaştırır.
extension ThemeExtensions on BuildContext {
  Color get lightGrey => const Color(0xFFF6F6F4);
  Color get grey => const Color(0xFF999999);
  Color get darkGrey => const Color(0xFF626262);
  Color get white => Colors.white;
  Color get black => Colors.black;

  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!.copyWith( fontFamily: 'Inter',color: black, fontWeight: FontWeight.bold,);
  TextStyle get bodySmall => Theme.of(this,).textTheme.bodySmall!.copyWith( fontFamily: 'Inter',color: darkGrey);
}
