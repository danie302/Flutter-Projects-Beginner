import 'package:flutter/material.dart';

import 'package:qr_scanner/widgets/widgets.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(type: 'geo');
  }
}
