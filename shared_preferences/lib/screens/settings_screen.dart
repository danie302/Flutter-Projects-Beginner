import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_preferences/provider/theme_provider.dart';
import 'package:user_preferences/shared_preferences/preferences.dart';

import 'package:user_preferences/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const String routeName = 'settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  int gender = 1;
  String name = 'Daniel';

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Settings',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            SwitchListTile.adaptive(
              value: Preferences.darkMode,
              title: const Text('Dark Mode'),
              onChanged: (value) {
                setState(() {
                  if (value) {
                    themeProvider.setDarkMode();
                  } else {
                    themeProvider.setLightMode();
                  }
                });
              },
            ),
            const Divider(),
            RadioListTile<int>(
              value: 1,
              groupValue: Preferences.gender,
              title: const Text('Male'),
              onChanged: (value) {
                setState(() {
                  Preferences.gender = value ?? 1;
                });
              },
            ),
            const Divider(),
            RadioListTile<int>(
              value: 2,
              groupValue: Preferences.gender,
              title: const Text('Female'),
              onChanged: (value) {
                setState(() {
                  Preferences.gender = value ?? 2;
                });
              },
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                initialValue: Preferences.name,
                onChanged: (value) {
                  setState(() {
                    Preferences.name = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Name',
                  helperText: 'Name of the user',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
