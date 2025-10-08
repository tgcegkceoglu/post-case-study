import 'package:intl/intl.dart';

extension StringCasingExtension on String { String capitalize() { if (isEmpty) return this; return this[0].toUpperCase() + substring(1); } } // String'in ilk harfini büyük yapar.

// Metindeki kelime sayısına göre tahmini okuma süresini dakika olarak hesaplar.
extension StringReadingExtension on String {
  int readingTime() {
    if (isEmpty) return 1;
    final words = split(RegExp(r'\s+')).length;
    final minutes = (words / 50).ceil();
    return minutes;
  }
}

//Tarih formatını bir formattan başka bir formata dönüştürür - Oct 8.
extension StringDateExtension on String {
  String toFormattedDate({String inputFormat = "dd/MM/yyyy HH:mm:ss", String outputFormat = "MMM d"}) {
    try {
      final date = DateFormat(inputFormat).parse(this);
      return DateFormat(outputFormat).format(date);
    } catch (e) {
      return this;
    }
  }
}