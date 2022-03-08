import 'package:flutter/material.dart';

class NotificationRepo {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showMessage(String message) {
    final SnackBar snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
