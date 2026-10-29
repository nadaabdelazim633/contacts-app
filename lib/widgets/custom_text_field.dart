






import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  });

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: color, width: 2),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      onChanged: onChanged,
      cursorColor: AppColors.gold,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.darkBlue,
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 16, color: AppColors.lightBlue),
        contentPadding: const EdgeInsets.all(16),
        errorStyle: const TextStyle(color: AppColors.red),
        enabledBorder: _border(AppColors.gold),
        focusedBorder: _border(AppColors.gold),
        errorBorder: _border(AppColors.red),
        focusedErrorBorder: _border(AppColors.red),
      ),
    );
  }
}