import 'package:flutter/material.dart';

import 'package:movies/models/models.dart';
import 'package:movies/screens/screens.dart';

class AppRoutes {
  static const String initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
      route: 'home',
      name: 'Home',
      screen: const HomeScreen(),
    ),
    MenuOption(
      route: 'details',
      name: 'Details',
      screen: const DetailsScreen(),
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({
      'home': (BuildContext context) => const HomeScreen(),
    });

    for (final option in menuOptions) {
      appRoutes.addAll({
        option.route: (BuildContext context) => option.screen,
      });
    }
    return appRoutes;
  }
}
