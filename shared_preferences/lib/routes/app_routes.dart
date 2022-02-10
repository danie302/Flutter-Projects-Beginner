import 'package:flutter/material.dart';

import 'package:shared_preferences/models/models.dart';
import 'package:shared_preferences/screens/screens.dart';

class AppRoutes {
  static const initialRoute = HomeScreen.routeName;

  static final routesList = <RouteScreen>[
    RouteScreen(routeName: HomeScreen.routeName, screen: const HomeScreen()),
    RouteScreen(
        routeName: SettingsScreen.routeName, screen: const SettingsScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final route in routesList) {
      appRoutes.addAll({
        route.routeName: (BuildContext context) => route.screen,
      });
    }

    return appRoutes;
  }
}
