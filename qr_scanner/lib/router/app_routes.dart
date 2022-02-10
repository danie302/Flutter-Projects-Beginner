import 'package:flutter/material.dart';

import 'package:qr_scanner/models/models.dart';
import 'package:qr_scanner/screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final routesList = <RouteScreen>[
    RouteScreen(routeName: 'home', screen: const HomeScreen()),
    RouteScreen(routeName: 'map', screen: const MapScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({
      'home': (BuildContext context) => const HomeScreen(),
    });

    for (final route in routesList) {
      appRoutes.addAll({
        route.routeName: (BuildContext context) => route.screen,
      });
    }

    return appRoutes;
  }
}
