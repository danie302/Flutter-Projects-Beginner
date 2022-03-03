import 'package:flutter/material.dart';
import 'package:products_app/styles/input_decorations.dart';
import 'package:products_app/themes/app_theme.dart';

import 'package:products_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = 'product';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const ProductImg(),
                _CardButton(
                  top: 60,
                  left: 20,
                  icon: Icons.arrow_back_ios_new_outlined,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                _CardButton(
                  top: 60,
                  right: 20,
                  icon: Icons.camera_alt_outlined,
                  onPressed: () {
                    // Camera
                  },
                ),
              ],
            ),
            const _ProductForm(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save_outlined),
        onPressed: () {},
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  const _ProductForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        decoration: _decoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecorations.authInputDecoration(
                    labelText: 'Name:',
                    hintText: 'Name of the product',
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                    labelText: 'Price:',
                    hintText: '\$0.00',
                  ),
                ),
                const SizedBox(height: 30),
                SwitchListTile.adaptive(
                  value: true,
                  activeColor: AppTheme.primary,
                  title: const Text('Available'),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _decoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 5),
              blurRadius: 5,
            ),
          ]);
}

class _CardButton extends StatelessWidget {
  final double? top;
  final double? right;
  final double? left;
  final double? bottom;
  final IconData icon;
  final Function onPressed;

  const _CardButton({
    Key? key,
    this.top,
    this.right,
    this.left,
    this.bottom,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: IconButton(
        onPressed: () {
          onPressed();
        },
        icon: Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
