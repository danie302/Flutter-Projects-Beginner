import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:products_app/widgets/widgets.dart';
import 'package:products_app/screens/screens.dart';
import 'package:products_app/provider/providers.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);

    if (productsProvider.isLoading) return const LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ListView.builder(
        itemCount: productsProvider.products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(ProductScreen.routeName),
          child: ProductCard(
            product: productsProvider.products[index],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed('/detail');
        },
      ),
    );
  }
}
