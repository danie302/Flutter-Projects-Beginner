import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/providers.dart';
import 'package:products_app/routes/app_routes.dart';

void main() => {
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthProvider()),
            ChangeNotifierProvider(create: (_) => ThemeProvider()),
            ChangeNotifierProvider(create: (_) => ProductsProvider()),
            ChangeNotifierProvider(create: (_) => ProductFormProvider()),
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
      theme: Provider.of<ThemeProvider>(context).currenteTheme(),
    );
  }
}
