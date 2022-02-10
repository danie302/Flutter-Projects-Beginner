import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String type;
  const ScanTiles({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanProvider = Provider.of<ScanListProvider>(context);
    final scans = scanProvider.scans;

    final IconData icon = type == 'geo' ? Icons.map : Icons.home_outlined;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          background: Container(
            color: const Color.fromARGB(255, 181, 57, 48),
            padding: const EdgeInsets.only(right: 20),
            alignment: Alignment.centerRight,
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (DismissDirection direction) {
            scanProvider.deleteScanById(scans[index].id!);
          },
          child: ListTile(
            leading: Icon(icon),
            title: Text(scans[index].value),
            subtitle: Text(scans[index].id.toString()),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
            onTap: () => launchURL(context, scans[index]),
          ),
        );
      },
    );
  }
}
