import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final IconData? icon;
  final bool obscureText;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final TextInputType? keyboardType;

  final String formProperty;
  final Map<String, String> formValues;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.keyboardType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: '',
      keyboardType: keyboardType,
      obscureText: obscureText,
      textCapitalization: TextCapitalization.words,
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        if (value!.isEmpty) return 'Please enter some text';
        return value.length < 3 ? 'Text too short' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        prefixIcon: icon == null ? null : Icon(icon),
      ),
    );
  }
}
