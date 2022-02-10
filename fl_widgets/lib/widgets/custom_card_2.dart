import 'package:flutter/material.dart';

class CustomCard2 extends StatelessWidget {
  final String imageUrl;
  final String? title;

  const CustomCard2({Key? key, required this.imageUrl, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage('assets/loading.jpg'),
            height: 400,
            fit: BoxFit.cover,
            width: double.infinity,
            fadeInDuration: const Duration(milliseconds: 300),
          ),
          if (title != null)
            Container(
              padding: const EdgeInsets.only(
                right: 20,
                top: 10,
                bottom: 10,
              ),
              child: Text(title!),
            ),
        ],
      ),
    );
  }
}
