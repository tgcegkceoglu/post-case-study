import 'package:flutter/material.dart';
import 'package:flutter_post_case_study/core/constants/padding_constants.dart';
import 'package:flutter_post_case_study/core/extensions/theme_extensions.dart';

// Uygulamada arama veya veri girişi için kullanılan özelleştirilmiş TextField.
class CustomTextfield extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String hintText;
  final Widget icon;
  const CustomTextfield({
    super.key,
    this.onChanged,
    required this.hintText,
    required this.icon,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: context.lightGrey,
        hintText: widget.hintText,
        contentPadding: PaddingConstants.textfieldGap,
        hintStyle: TextStyle(color: context.darkGrey),
        prefixIcon:  widget.icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
