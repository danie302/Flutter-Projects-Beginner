import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String labelText,
    required String hintText,
    required IconData icon,
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
      prefixIcon: Icon(
        icon,
        color: Colors.deepPurple,
      ),
    );
  }
}
