import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:products_app/themes/app_theme.dart';
import 'package:products_app/widgets/widgets.dart';
import 'package:products_app/provider/providers.dart';
import 'package:products_app/styles/input_decorations.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = 'product';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    final productFormProvider = Provider.of<ProductFormProvider>(context);
    final product = productProvider.selectedProduct;
    if (productFormProvider.product.id != product.id) {
      productFormProvider.product = product;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImg(
                  img: product.picture,
                ),
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
                  onPressed: () async {
                    final imagePicker = ImagePicker();
                    final pickedImg = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    if (pickedImg == null) return;
                    productProvider.updateProductImg(pickedImg.path);
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
        onPressed: () async {
          if (productFormProvider.isValidForm()) return;
          await productProvider
              .saveOrCreateProduct(productFormProvider.product);
          Navigator.of(context).pop();
        },
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
    final productFormProvider = Provider.of<ProductFormProvider>(context);
    final productForm = productFormProvider.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        decoration: _decoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: productForm.name,
                  onChanged: (value) => productForm.name = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                  decoration: InputDecorations.authInputDecoration(
                    labelText: 'Name:',
                    hintText: 'Name of the product',
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  initialValue: '${productForm.price}',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  onChanged: (value) {
                    if (value.isEmpty) {
                      productForm.price = 0;
                    } else {
                      productForm.price = double.parse(value);
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price';
                    }
                    if (double.tryParse(value) == null || value == '') {
                      return 'Please enter a valid price';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecorations.authInputDecoration(
                    labelText: 'Price:',
                    hintText: '\$0.00',
                  ),
                ),
                const SizedBox(height: 30),
                SwitchListTile.adaptive(
                  value: productForm.available,
                  activeColor: AppTheme.primary,
                  title: const Text('Available'),
                  onChanged: productFormProvider.updateAvailability,
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
