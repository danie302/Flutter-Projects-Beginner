import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/models/scan_model.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

import 'package:qr_scanner/widgets/widgets.dart';
import 'package:qr_scanner/screens/screens.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final scanProvider = Provider.of<ScanListProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
        actions: [
          IconButton(
            onPressed: () => scanProvider.deleteScans(),
            icon: const Icon(Icons.delete_forever),
          )
        ],
      ),
      body: const _HomePageBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const CustomFloatingActionButton(),
      bottomNavigationBar: CustomNavigationBar(
        onTap: uiProvider.setSelectedMenuOption,
        currentIndex: uiProvider.getSelectedMenuOption,
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final scanProvider = Provider.of<ScanListProvider>(context, listen: false);
    switch (uiProvider.getSelectedMenuOption) {
      case 0:
        scanProvider.loadScanByType('geo');
        return const HistoryScreen();

      case 1:
        scanProvider.loadScanByType('http');
        return const DirectionsScreen();

      default:
        return const HistoryScreen();
    }
  }
}
