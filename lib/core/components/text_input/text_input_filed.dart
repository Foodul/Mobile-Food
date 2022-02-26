import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final Widget? subfixIcon;

  const TextInputField({
    this.controller,
    this.labelText,
    this.textInputType,
    this.obscureText,
    this.validator,
    this.subfixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: textInputType,
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(),
            disabledBorder: const UnderlineInputBorder(),
            focusedBorder: const UnderlineInputBorder(),
            contentPadding: const EdgeInsets.all(0),
            labelText: labelText,
            suffixIcon: subfixIcon),
        obscureText: obscureText ?? false);
  }
}
