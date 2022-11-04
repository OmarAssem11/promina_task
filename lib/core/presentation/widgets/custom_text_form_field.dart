import 'package:flutter/material.dart';
import 'package:promina_task/core/presentation/resources/values_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.isObscure = false,
    this.prefixIcon,
    this.validator,
    this.fillColor,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool isObscure;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      controller: controller,
      style: textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textTheme.bodyMedium,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.s28),
          borderSide: BorderSide.none,
        ),
        filled: fillColor != null,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Insets.l,
        ),
      ),
      autocorrect: false,
      keyboardType: keyboardType,
      validator: validator,
      obscureText: isObscure,
    );
  }
}
