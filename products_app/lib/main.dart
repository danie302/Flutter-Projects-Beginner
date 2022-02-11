import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:products_app/routes/app_routes.dart';
import 'package:products_app/provider/theme_provider.dart';

void main() => {
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => ThemeProvider(),
            ),
          ],
          child: const MyApp(),
        ),
      )
    };

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products App',
      routes: AppRoutes.getAppRoutes(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
