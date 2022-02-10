import 'package:fl_widgets/themes/app_theme.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _value = 100.0;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders & Checks'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Slider.adaptive(
            value: _value,
            activeColor: AppTheme.primary,
            onChanged: _isChecked
                ? (value) {
                    setState(() {
                      _value = value;
                    });
                  }
                : null,
            min: 50,
            max: 600,
          ),
          Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              }),
          CheckboxListTile(
              title: const Text('Enable slider'),
              activeColor: AppTheme.primary,
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              }),
          Switch(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value;
                });
              }),
          SwitchListTile.adaptive(
              title: const Text('Enable slider'),
              activeColor: AppTheme.primary,
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value;
                });
              }),
          const AboutListTile(),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                fit: BoxFit.contain,
                width: _value,
                image: const NetworkImage(
                    'https://wallpaperaccess.com/full/1911104.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
