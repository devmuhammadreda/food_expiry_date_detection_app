import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:food_expiry_date_detection_app/hive_registrar.g.dart';
import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import '../models/scan_log_model.dart';

class ScanLogLocalDataSource {
  // Singleton instance
  static final ScanLogLocalDataSource _instance =
      ScanLogLocalDataSource._internal();
  factory ScanLogLocalDataSource() => _instance;
  ScanLogLocalDataSource._internal();

  Box<ScanLogModel>? scanLogBox;
  final String _scanLogBoxName = 'scanLogBox';

  Future<Box<ScanLogModel>> _openHiveBox() async {
    if (!kIsWeb && !Hive.isBoxOpen(_scanLogBoxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return await Hive.openBox<ScanLogModel>(_scanLogBoxName);
  }

  Future<void> init() async {
    log('Initializing ScanLogLocalDataSource...');
    Hive.registerAdapters();
    scanLogBox = await _openHiveBox();
    log('ScanLogLocalDataSource initialized successfully.');
  }

  Future<void> addScanLog(ScanLogModel log) async {
    if (scanLogBox == null) {
      throw Exception(
          'ScanLogBox has not been initialized. Call init() first.');
    }
    await scanLogBox!.put(log.uid, log);
  }

  Future<void> updateScanLog(String uid, ScanLogModel log) async {
    if (scanLogBox == null) {
      throw Exception(
          'ScanLogBox has not been initialized. Call init() first.');
    }
    await scanLogBox!.put(uid, log);
  }

  Future<void> deleteScanLog(String uid) async {
    if (scanLogBox == null) {
      throw Exception(
          'ScanLogBox has not been initialized. Call init() first.');
    }
    await scanLogBox!.delete(uid);
  }

  Stream<List<ScanLogModel>> getScanLogs() async* {
    if (scanLogBox == null) {
      throw Exception(
          'ScanLogBox has not been initialized. Call init() first.');
    }
    yield scanLogBox!.values.toList();

    yield* scanLogBox!.watch().map((event) {
      return scanLogBox!.values.toList();
    });
  }

  Future<void> closeBox() async {
    if (scanLogBox != null) {
      await scanLogBox!.close();
    }
  }
}
