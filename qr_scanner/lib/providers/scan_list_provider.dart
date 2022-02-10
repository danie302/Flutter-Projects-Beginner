import 'package:flutter/material.dart';
import 'package:qr_scanner/models/models.dart';
import 'package:qr_scanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> _scans = [];

  String _selectedType = 'http';
  set selectedType(String value) {
    _selectedType = value;
  }

  List<ScanModel> get scans => _scans;

  int get count => _scans.length;

  void addScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DbProvider.db.newScan(newScan);
    newScan.id = id;
    if (_selectedType == newScan.type) {
      _scans.add(newScan);
      notifyListeners();
    }
  }

  loadScans() async {
    _scans = [...await DbProvider.db.getScans()];
    notifyListeners();
  }

  loadScanByType(String type) async {
    _scans = [...await DbProvider.db.getScansByType(type)];
    _selectedType = type;
    notifyListeners();
  }

  deleteScans() async {
    await DbProvider.db.deleteAllScan();
    _scans = [];
    notifyListeners();
  }

  deleteScanById(int id) async {
    await DbProvider.db.deleteScan(id);
  }
}
