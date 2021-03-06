import 'package:flutter/material.dart';

import 'package:products_app/models/models.dart';
import 'package:products_app/screens/screens.dart';

class AppRoutes {
  static const initialRoute = CheckAuthScreenScreen.routeName;

  static final routesList = <RouteScreen>[
    RouteScreen(
      routeName: HomeScreen.routeName,
      screen: const HomeScreen(),
    ),
    RouteScreen(
      routeName: LoginScreen.routeName,
      screen: const LoginScreen(),
    ),
    RouteScreen(
      routeName: CheckAuthScreenScreen.routeName,
      screen: const CheckAuthScreenScreen(),
    ),
    RouteScreen(
      routeName: RegisterScreen.routeName,
      screen: const RegisterScreen(),
    ),
    RouteScreen(
      routeName: LoadingScreen.routeName,
      screen: const LoadingScreen(),
    ),
    RouteScreen(
      routeName: ProductScreen.routeName,
      screen: const ProductScreen(),
    ),
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
