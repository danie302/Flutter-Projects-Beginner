import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    IconData? icon,
    required String labelText,
    required String hintText,
  }) {
    return InputDecoration(
      labelText: labelText,
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple, width: 2),
      ),
      hintText: hintText,
      labelStyle: const TextStyle(
        color: Colors.deepPurple,
      ),
      prefixIcon: icon != null
          ? Icon(
              icon,
              color: Colors.deepPurple,
            )
          : null,
    );
  }
}
