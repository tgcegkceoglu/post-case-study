import 'package:flutter/material.dart';
import 'package:flutter_post_case_study/core/constants/padding_constants.dart';
import 'package:flutter_post_case_study/core/extensions/string_extensions.dart';
import 'package:flutter_post_case_study/core/extensions/theme_extensions.dart';

// Kategori seçimi veya benzeri seçenekler için özel bir TextButton
// title: Button üzerindeki metin
// onPressed: Button’a tıklandığında çalışacak fonksiyon
// isSelected: Seçili olup olmadığı (stil için)

class CustomTextButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final bool isSelected;
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        padding: WidgetStateProperty.all(PaddingConstants.zero),
        minimumSize:WidgetStateProperty.all(Size.zero),
      ),
      onPressed: onPressed,
      child: Text(
        title.capitalize(),
        style: context.titleMedium.copyWith(
          color: isSelected ? context.black : context.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w300,
        ),
      ),
    );
  }
}
