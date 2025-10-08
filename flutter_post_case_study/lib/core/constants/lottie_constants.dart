import 'package:lottie/lottie.dart';
//  Uygulamada kullanılan Lottie animasyonlarını tek bir enum ile yönetir.
enum LottieConstants{
  loading('loading'),
  notFound('notFound'),
  error('error');

  final String value;
  const LottieConstants(this.value);

  String get toJson => 'assets/lottie/$value.json';
  LottieBuilder get toLottie => Lottie.asset(toJson,);

}