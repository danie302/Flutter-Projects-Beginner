import 'package:flutter/material.dart';

import 'package:products_app/models/models.dart';
import 'package:products_app/themes/app_theme.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorder(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BackgroundImg(
              img: product.picture,
            ),
            if (!product.available) const NotAvailable(),
            ProductInfo(
              product: product,
            ),
            PriceTag(price: product.price),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorder() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 10),
            blurRadius: 10,
          ),
        ],
      );
}

class NotAvailable extends StatelessWidget {
  const NotAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        width: 100,
        height: 70,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Not Available',
              style: _textStyle(),
            ),
          ),
        ),
        decoration: _boxDecoration(),
      ),
    );
  }

  TextStyle _textStyle() => const TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  BoxDecoration _boxDecoration() => BoxDecoration(
        color: AppTheme.warning,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      );
}

class PriceTag extends StatelessWidget {
  final double price;
  const PriceTag({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        width: 100,
        height: 70,
        alignment: Alignment.center,
        decoration: _boxDecoration(),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              '\$$price',
              style: _textStyle(),
            ),
          ),
        ),
      ),
      right: 0,
      top: 0,
    );
  }

  BoxDecoration _boxDecoration() => const BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      );

  TextStyle _textStyle() => const TextStyle(
        fontSize: 20,
        color: Colors.white,
      );
}

class BackgroundImg extends StatelessWidget {
  final String? img;
  const BackgroundImg({
    Key? key,
    this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: img == null
            ? const Image(
                image: AssetImage('assets/no-image.png'),
                fit: BoxFit.cover,
              )
            : FadeInImage(
                image: NetworkImage(img!),
                placeholder: const AssetImage('assets/no-image.png'),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  final Product product;
  const ProductInfo({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'id: ${product.id}',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      );
}
