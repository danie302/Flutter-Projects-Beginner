import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_preferences/provider/theme_provider.dart';

import 'package:user_preferences/themes/app_theme.dart';
import 'package:user_preferences/routes/app_routes.dart';
import 'package:user_preferences/shared_preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Shared Preferences',
      theme: themeProvider.currenteTheme(),
      routes: AppRoutes.getAppRoutes(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
