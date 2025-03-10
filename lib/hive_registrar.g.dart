// Generated by Hive CE
// Do not modify
// Check in to version control

import 'package:hive_ce/hive.dart';
import 'package:food_expiry_date_detection_app/app/data/models/scan_log_model.dart';
import 'package:food_expiry_date_detection_app/core/enums/enums.dart';

extension HiveRegistrar on HiveInterface {
  void registerAdapters() {
    registerAdapter(ProductExpiryStatusAdapter());
    registerAdapter(ScanLogModelAdapter());
    registerAdapter(ScanTypeAdapter());
  }
}
