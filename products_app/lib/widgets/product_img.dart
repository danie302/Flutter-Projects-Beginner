import 'package:flutter/material.dart';

class ProductImg extends StatelessWidget {
  final String? img;
  const ProductImg({Key? key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        decoration: _boxDecoration(),
        width: double.infinity,
        height: 450,
        child: Opacity(
          opacity: 0.9,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45),
              topRight: Radius.circular(45),
            ),
            child: getImage(img),
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() => BoxDecoration(
        color: Colors.black,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      );
}

Widget getImage(String? img) {
  if (img == null) {
    return const Image(
      image: AssetImage('assets/no-image.png'),
      fit: BoxFit.cover,
    );
  }

  if (img.startsWith('http')) {
    return FadeInImage(
      image: NetworkImage(img),
      placeholder: const AssetImage('assets/jar-loading.gif'),
      fit: BoxFit.cover,
    );
  } else {
    return FadeInImage(
      image: AssetImage(img),
      placeholder: const AssetImage('assets/jar-loading.gif'),
      fit: BoxFit.cover,
    );
  }
}
