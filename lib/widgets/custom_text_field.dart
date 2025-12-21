import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? hintText;
  bool? obscureText;
  TextInputType? inputType;
  Function(String)? onChanged;
  CustomTextField({
    this.hintText,
    this.inputType,
    this.onChanged,
    this.obscureText = false,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText!,
      keyboardType: inputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
