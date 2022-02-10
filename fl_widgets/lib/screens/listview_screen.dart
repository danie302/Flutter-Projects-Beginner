import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({Key? key}) : super(key: key);

  final options = const ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView'),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(options[index]),
              trailing: const Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              onTap: () {},
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 2,
            );
          },
          itemCount: options.length,
        ));
  }
}
