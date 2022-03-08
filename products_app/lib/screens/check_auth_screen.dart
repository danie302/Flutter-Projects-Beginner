import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:products_app/screens/screens.dart';
import 'package:products_app/provider/auth_provider.dart';

class CheckAuthScreenScreen extends StatelessWidget {
  static const String routeName = 'check-auth';

  const CheckAuthScreenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: authProvider.getUser(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator.adaptive();
            } else {
              Future.microtask(
                () {
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const HomeScreen(),
                      transitionDuration: const Duration(seconds: 0),
                    ),
                  );
                },
              );
              return Container();
            }
          },
        ),
      ),
    );
  }
}
