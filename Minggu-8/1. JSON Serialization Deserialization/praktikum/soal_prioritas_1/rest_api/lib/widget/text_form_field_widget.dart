import 'package:flutter/material.dart';

import '../theme/theme_text_style.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  const TextFormFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        labelText: labelText,
        labelStyle: ThemeTextStyle().m3BodySmall,
        hintText: hintText,
        hintStyle: ThemeTextStyle().m3BodyLarge,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
