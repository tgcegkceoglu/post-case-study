
import 'package:flutter_svg/flutter_svg.dart';
// Uygulamada kullanılan görsel dosyalarını tek bir enum ile yönetir.
enum ImageConstants{
  menu('menu'),
  search('search'),
  avatar('avatar');

  final String value;
  const ImageConstants(this.value);

  String get toPng => 'assets/images/$value.png';

  String get toSvg => 'assets/images/$value.svg';
  SvgPicture  get toSvgImage => SvgPicture.asset(toSvg);
}