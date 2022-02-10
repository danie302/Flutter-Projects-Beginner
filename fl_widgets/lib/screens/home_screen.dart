import 'package:fl_widgets/router/app_routes.dart';
import 'package:fl_widgets/themes/app_theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            title: Text(menuOptions[index].name),
            leading: Icon(
              menuOptions[index].icon,
              color: AppTheme.primary,
            ),
            onTap: () {
              Navigator.pushNamed(context, menuOptions[index].route);
            },
          ),
          separatorBuilder: (context, index) => const Divider(
            thickness: 1,
          ),
          itemCount: menuOptions.length,
        ));
  }
}
