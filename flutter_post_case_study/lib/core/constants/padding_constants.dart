import 'package:flutter/material.dart';
// Uygulamada kullanılan tüm padding değerlerini bir arada tutar.
@immutable
class PaddingConstants {

  static const EdgeInsets zero = EdgeInsets.zero;
  
  // horizontal gap
  static const EdgeInsets hor5Gap = EdgeInsets.symmetric(horizontal: 5);
  static const EdgeInsets hor20Gap = EdgeInsets.symmetric(horizontal: 20);

  // all gap
  static const EdgeInsets all20Gap = EdgeInsets.all(20);
  static const EdgeInsets allMinGap = EdgeInsets.all(10);

  // right gap
  static const EdgeInsets right15Gap = EdgeInsets.only(right:15);
  static const EdgeInsets right30Gap = EdgeInsets.only(right:60);
  static const EdgeInsets right8Gap = EdgeInsets.only(right:8);

  // bottom gap
  static const EdgeInsets bottom30Gap = EdgeInsets.only(bottom:30);
  static const EdgeInsets bottom15Gap = EdgeInsets.only(bottom:15);
  static const EdgeInsets bottom5Gap = EdgeInsets.only(bottom:5);

  // top gap
  static const EdgeInsets top15Gap = EdgeInsets.only(top:15);

  // textfield gap
  static const EdgeInsets textfieldGap = EdgeInsets.symmetric(vertical:6,horizontal: 12);


}
