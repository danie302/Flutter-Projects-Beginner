import 'package:flutter/material.dart';
import 'package:products_app/themes/app_theme.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

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
          children: const [
            BackgroundImg(),
            NotAvailable(),
            ProductInfo(),
            PriceTag(),
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
  const PriceTag({
    Key? key,
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
              '\$103,99',
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
  const BackgroundImg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        color: Colors.red,
        child: const FadeInImage(
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          placeholder: AssetImage('assets/no-image.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key}) : super(key: key);

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
          children: const [
            Text(
              'Hard Drive C:',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'id: 123456789',
              style: TextStyle(
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
