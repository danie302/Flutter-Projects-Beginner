import 'package:flutter/material.dart';

import 'package:fl_widgets/models/models.dart';
import 'package:fl_widgets/screens/screens.dart';

class AppRoutes {
  static const String initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
      route: 'listview',
      name: 'List View',
      screen: const ListViewScreen(),
      icon: Icons.list,
    ),
    MenuOption(
      route: 'alert',
      name: 'Alert',
      screen: const AlertScreen(),
      icon: Icons.add_alert_outlined,
    ),
    MenuOption(
      route: 'card',
      name: 'Card',
      screen: const CardScreen(),
      icon: Icons.card_membership_outlined,
    ),
    MenuOption(
      route: 'avatar',
      name: 'Avatar',
      screen: const AvatarScreen(),
      icon: Icons.supervised_user_circle_outlined,
    ),
    MenuOption(
      route: 'animated',
      name: 'Animated',
      screen: const AnimatedScreen(),
      icon: Icons.play_circle_outline_rounded,
    ),
    MenuOption(
      route: 'inputs',
      name: 'Inputs',
      screen: const InputsScreen(),
      icon: Icons.input_outlined,
    ),
    MenuOption(
      route: 'slider',
      name: 'Slider',
      screen: const SliderScreen(),
      icon: Icons.slideshow_sharp,
    ),
    MenuOption(
      route: 'listviewbuilder',
      name: 'List view && Pull to refresh',
      screen: const ListViewBuilderScreen(),
      icon: Icons.image,
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
