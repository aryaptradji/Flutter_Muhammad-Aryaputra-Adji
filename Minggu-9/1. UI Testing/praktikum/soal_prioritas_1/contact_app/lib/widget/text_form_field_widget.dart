import 'package:contact_app/theme/theme_color.dart';
import 'package:contact_app/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;

  const TextFormFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: ThemeColor().m3SysLightPurple70,
        labelText: labelText,
        labelStyle: ThemeTextStyle().m3BodySmall,
        hintText: hintText,
        hintStyle: ThemeTextStyle().m3BodyLarge,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
