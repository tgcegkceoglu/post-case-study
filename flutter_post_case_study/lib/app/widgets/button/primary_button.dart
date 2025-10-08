import 'package:flutter/material.dart';
import 'package:flutter_post_case_study/core/constants/padding_constants.dart';
import 'package:flutter_post_case_study/core/extensions/theme_extensions.dart';

//  Uygulamada ana aksiyonlar için kullanılan özelleştirilmiş buton.
class PrimaryButton extends StatelessWidget {
  final String title;
  final Null Function() onPressed;
  const PrimaryButton({super.key, required this.title , required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: PaddingConstants.allMinGap,
      ),
      child: Text(
        title,
        style: context.bodySmall.copyWith(color: context.black),
      ),
    );
  }
}
